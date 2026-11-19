-- Supabase > SQL Editor içinde tek seferde çalıştır.

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  username text not null unique check (username ~ '^[A-Za-z0-9_]{3,20}$'),
  is_admin boolean not null default false,
  created_at timestamptz not null default now()
);

create table public.posts (
  id bigint generated always as identity primary key,
  author_id uuid not null default auth.uid() references public.profiles(id) on delete cascade,
  title text not null check (char_length(title) between 3 and 120),
  body text not null check (char_length(body) between 10 and 5000),
  created_at timestamptz not null default now()
);

alter table public.profiles enable row level security;
alter table public.posts enable row level security;

create function public.is_admin() returns boolean
language sql security definer set search_path = public stable as $$
  select coalesce((select is_admin from public.profiles where id = auth.uid()), false)
$$;

-- Kayıt olunca profil otomatik oluşur (kullanıcı adı kayıt formundan gelir).
create function public.handle_new_user() returns trigger
language plpgsql security definer set search_path = public as $$
begin
  -- İSTEĞE BAĞLI: sadece üniversite e-postasına izin vermek için aşağıdaki satırın başındaki -- işaretini kaldır
  -- if new.email not like '%@ALAN_ADI.edu.tr' then raise exception 'Sadece üniversite e-postası'; end if;
  insert into public.profiles (id, username) values (new.id, new.raw_user_meta_data->>'username');
  return new;
end $$;

create trigger on_auth_user_created after insert on auth.users
  for each row execute function public.handle_new_user();

-- Herkes okuyabilir; profil yalnızca tetikleyiciyle oluşur (kimse kendini yönetici yapamaz).
create policy "profilleri herkes okur" on public.profiles for select using (true);
create policy "yazıları herkes okur" on public.posts for select using (true);
create policy "üye kendi adına yazar" on public.posts for insert to authenticated with check (auth.uid() = author_id);
create policy "yazar veya yönetici siler" on public.posts for delete to authenticated using (auth.uid() = author_id or public.is_admin());
