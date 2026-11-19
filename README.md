# THKÜ | UTAA Hezarfen Club – Web Sitesi

Öğrenci topluluğu için tek sayfalık, saf HTML/CSS/JS web sitesi. Derleme gerektirmez; GitHub Pages ile ücretsiz yayınlanır.

## Dosyalar
- `index.html` – Sitenin tamamı (içerik, stil, script)
- `assets/logo.webp` – Güncel logo
- `assets/logo-onursal.webp` – Onursal logo (2017–2023)
- `assets/logo-white.webp` – Logonun diğer varyantı
- `.nojekyll` – GitHub Pages’in dosyaları olduğu gibi sunmasını sağlar

## GitHub Pages ile yayınlama
1. GitHub’da yeni bir repo oluştur (ör. `hezarfen-site`).
2. Bu klasördeki **tüm dosyaları (assets klasörü dahil)** repoya yükle:
   ```bash
   git init
   git add .
   git commit -m "İlk sürüm"
   git branch -M main
   git remote add origin https://github.com/KULLANICI_ADIN/hezarfen-site.git
   git push -u origin main
   ```
3. Repoda **Settings → Pages** bölümüne git.
4. **Source:** Deploy from a branch, **Branch:** `main`, klasör `/ (root)` seç ve **Save**’e bas.
5. Birkaç dakika sonra site `https://KULLANICI_ADIN.github.io/hezarfen-site/` adresinde yayında olur.

## İçeriği düzenleme
`index.html` içinde şunları kendi bilgilerinle değiştir: vizyon/misyon metinleri, sayısal veriler (`data-n="120"` gibi), yönetim kurulu ve komite kartları, proje kartları, duyurular (`POSTS` listesi), e-posta adresi (`hezarfen@ornek.edu.tr`) ve sosyal medya bağlantıları (`href="#"`).

Değişiklikten sonra `git add . && git commit -m "Güncelleme" && git push` yeterlidir.

## Üyelik formu
Form şu an başvuruyu e-posta uygulamasında hazır bir mesaj olarak açar. Başvuruların bir listeye düşmesi için Google Forms bağlantısı veya Formspree gibi bir servis eklenebilir.
