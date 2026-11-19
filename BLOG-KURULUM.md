# Üye Blogu Kurulumu (Supabase)

GitHub Pages yalnızca statik dosya sunar; üyelik ve ortak yazı kaydı için ücretsiz bir servis olan Supabase kullanılır.

1. supabase.com'da ücretsiz hesap aç ve **New project** ile proje oluştur.
2. Soldan **SQL Editor**'ü aç, `supabase-kurulum.sql` dosyasının içeriğini yapıştırıp **Run**'a bas.
3. **Authentication → URL Configuration** bölümünde **Site URL** alanına GitHub Pages adresini yaz (ör. `https://KULLANICI_ADIN.github.io/hezarfen-site/`).
4. **Project Settings → API** sayfasından **Project URL** ve **anon public** anahtarı kopyala, `config.js` içine yaz. `service_role` anahtarını asla yazma.
5. Değişiklikleri GitHub'a yükle (`config.js`, `uye-blog.html` ve `index.html` dahil).
6. Sitede **Üye Ol** ile kendi hesabını aç, e-postandaki bağlantıyla doğrula. Sonra SQL Editor'de kendini yönetici yap (yöneticiler her yazıyı silebilir):
   ```sql
   update public.profiles set is_admin = true where username = 'KULLANICI_ADIN';
   ```

## Notlar
- Giriş e-posta + şifre ile yapılır; yazılarda kullanıcı adı görünür.
- Herkes üye olup yazabildiği için uygunsuz içerik riskine karşı yöneticiler yazı silebilir. Sadece üniversite e-postasına izin vermek için SQL dosyasındaki isteğe bağlı satırı etkinleştirebilirsin.
- Yazılar düz metin olarak gösterilir; HTML çalıştırılmaz.
