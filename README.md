
**Kod Yazma Tarzım ve Mimari Yaklaşımımın Örneği**

Bu proje, Flutter ile modern, temiz ve ölçeklenebilir kod yazma tarzımı göstermek için oluşturulmuş bir örnek uygulamadır. Yapay zeka destekli resim dönüştürme konsepti üzerinden, Clean Architecture, GetX state management, responsive design ve kod organizasyonu prensiplerimi sergiliyorum.

## 🎯 Bu Projede Gösterdiğim Kodlama Prensipleri

### 🏗️ **Clean Architecture**
- Katmanlı mimari yapısı (Controller → Service → Model)
- Dependency injection

### 🎨 **Modern UI/UX Yaklaşımı**
- **Ortak Tasarım Sistemi**: Gradient'ler, shadow'lar ve padding'ler tek yerden yönetiliyor
- **Responsive Design**: Tüm ekran boyutları için optimize edilmiş layout
- **Consistent Styling**: Context extension'lar ile tutarlı stil yönetimi

### 📱 **GetX State Management**
- Reactive programming yaklaşımı
- Memory efficient state management
- Clean controller yapısı

### 🔧 **Kod Organizasyonu**
- **Modüler Yapı**: Her özellik kendi klasöründe
- **Reusable Components**: Ortak widget'lar
- **Extension'lar**: Dart extension'ları ile kod tekrarını önleme

## ✨ Özellikler

- 🖼️ **Çoklu Resim Yükleme**: Birden fazla resmi aynı anda yükleyebilirsiniz
- 🤖 **AI Destekli Dönüştürme**: Yapay zeka ile resimlerinizi istediğiniz gibi değiştirin
- 📱 **Responsive Tasarım**: Tüm cihazlarda mükemmel görünüm
- 🎨 **Modern UI/UX**: Gradient'ler ve shadow'larla zenginleştirilmiş arayüz
- ⚡ **Hızlı ve Performanslı**: Optimize edilmiş kod yapısı

## 🚀 Teknolojiler

- **Flutter**: Cross-platform UI framework
- **GetX**: State management ve dependency injection
- **Dio**: HTTP client
- **File Picker**: Dosya seçimi
- **Responsive Design**: Tüm ekran boyutları için optimize

## 🏗️ Proje Yapısı

```
lib/
├── app.dart                    # Ana uygulama
├── main.dart                   # Uygulama giriş noktası
├── common/
│   └── widgets/               # Ortak widget'lar
│       ├── app_header.dart    # Uygulama başlığı
│       └── status_popup.dart  # Durum popup'ları
├── screens/
│   ├── app_pages.dart         # Sayfa rotaları
│   └── home_screen/          # Ana ekran
│       ├── controller/        # GetX controller'ları
│       ├── model/            # Veri modelleri
│       └── view/             # UI bileşenleri
│           └── components/   # Widget bileşenleri
├── services/                 # Servisler
│   ├── api_service/         # API servisi
│   ├── app_service/         # Uygulama servisi
│   └── translation_service/ # Çeviri servisi
└── utils/                   # Yardımcı araçlar
    ├── extension/           # Dart extension'ları
    └── theme/              # Tema dosyaları
```

## 🎨 Tasarım Sistemi

### Gradient'ler
- `primaryGradient`: Ana sayfa arka plan
- `cardGradient`: Kart widget'ları
- `buttonGradient`: Butonlar
- `headerGradient`: Header
- `textGradient`: Metin shader mask

### Shadow'lar
- `cardShadow`: Genel kartlar
- `buttonShadow`: Butonlar
- `imageCardShadow`: Resim kartları
- `dropZoneShadow`: Dosya yükleme alanı
- `popupShadow`: Popup'lar

### Padding'ler
- `xsmallPadding`: 12px
- `smallPadding`: 18px
- `mediumPadding`: 32px
- `largePadding`: 48px
- `xlargePadding`: 64px

## 🔧 Geliştirme

### Kod Standartları
- Clean Architecture prensipleri
- GetX state management
- Responsive design patterns
- Consistent naming conventions

## 💡 Kodlama Yaklaşımım Hakkında

Bu projede gösterdiğim temel prensipler:

1. **DRY (Don't Repeat Yourself)**: Ortak gradient'ler, shadow'lar ve padding'ler
2. **SOLID Principles**: Single responsibility, Open/closed, Liskov substitution
3. **Clean Code**: Anlamlı isimlendirme, küçük fonksiyonlar
4. **Separation of Concerns**: UI, business logic ve data katmanları ayrı
5. **Reactive Programming**: GetX ile reactive state management
6. **Responsive Design**: Tüm cihazlarda tutarlı deneyim
