# Cat Breeds 🐱

Una aplicación Flutter que muestra información detallada sobre diferentes razas de gatos. La app incluye búsqueda, filtrado y detalles completos de cada raza con arquitectura modular y limpia.

## 🚀 Características

- **Listado de razas de gatos** con búsqueda en tiempo real
- **Pantalla de detalle** con información completa de cada raza
- **Información detallada**: Origen, inteligencia, adaptabilidad, esperanza de vida
- **Soporte multiidioma**: Inglés y Español
- **Arquitectura modular** con separación de concerns
- **Inyección de dependencias** usando Injectable
- **Manejo de errores** con patrón Result (Either)
- **Tests completos**: Unitarios y de widgets

## 📋 Requisitos

- Flutter 3.10.8 o superior
- Dart 3.10.8 o superior
- Android SDK (para Android) o Xcode (para iOS)

## 🛠️ Instalación

1. **Clonar el repositorio**
```bash
git clone <repository-url>
cd cat_breeds
```

2. **Obtener dependencias**
```bash
flutter pub get
```

3. **Generar código (inyección de dependencias)**
```bash
dart run build_runner build
```

4. **Ejecutar la aplicación**
```bash
flutter run
```

## 📁 Estructura del Proyecto

```
cat_breeds/
├── lib/                          # Código principal de la app
│   ├── main.dart                 # Punto de entrada
│   ├── di/                       # Inyección de dependencias
│   ├── l10n/                     # Archivos de localización (ARB)
│   ├── l10n-generated/           # Clases generadas de localización
│   ├── presentation/             # Capa de presentación (UI)
│   │   ├── landing/              # Pantalla principal
│   │   ├── detail/               # Pantalla de detalle
│   │   └── splash/               # Pantalla de splash
│   └── shared/                   # Utilidades compartidas
│       ├── router.dart           # Configuración de rutas
│       ├── dimensions.dart       # Dimensiones constantes
│       └── constants.dart        # Constantes de la app
│
├── modules/
│   ├── domain/                   # Capa de dominio (lógica de negocio)
│   │   ├── lib/
│   │   │   ├── model/            # Modelos de dominio
│   │   │   ├── repository/       # Interfaces de repositorios
│   │   │   ├── use_case/         # Casos de uso
│   │   │   ├── core/             # Clases base (Result, etc)
│   │   │   └── failures/         # Definición de errores
│   │   └── test/
│   │       ├── builder/          # Test builders
│   │       └── cat_breed_use_case_test.dart
│   │
│   └── infrastructure/           # Capa de infraestructura
│       ├── lib/
│       │   ├── datasource/       # Fuentes de datos
│       │   └── repository/       # Implementaciones de repositorios
│       └── test/
│
├── test/                         # Tests de la aplicación principal
│   ├── builder/                  # Test builders
│   ├── detail_widget_test.dart   # Tests del widget de detalle
│   ├── landing_widget_test.dart  # Tests del widget de landing
│   └── cat_breed_card_test.dart  # Tests de la tarjeta
│
├── android/                      # Código nativo Android
├── ios/                          # Código nativo iOS
└── pubspec.yaml                  # Dependencias y configuración
```

## 🏗️ Arquitectura

El proyecto sigue una arquitectura modular limpia con tres capas principales:

### 1. **Domain (Dominio)**
Contiene la lógica de negocio pura, independiente de frameworks:
- **Models**: `CatBreed` - Modelo de datos
- **Repositories**: Interfaces para acceso a datos
- **Use Cases**: `CatBreedUseCase` - Lógica de aplicación
- **Failures**: Tipos de errores personalizados
- **Result**: Patrón Either para manejo de errores

### 2. **Infrastructure (Infraestructura)**
Implementa los detalles técnicos:
- **Datasources**: Acceso a APIs, BD local, etc
- **Repositories**: Implementaciones de las interfaces del dominio

### 3. **Presentation (Presentación)**
Capa de UI con Riverpod para manejo de estado:
- **Screens**: Pantallas principales
- **Widgets**: Componentes reutilizables
- **Providers**: Gestión de estado con Riverpod

## 🧪 Tests

El proyecto incluye tests unitarios y de widgets con cobertura completa:

### Tests Unitarios
```bash
cd modules/domain
dart test
```

Tests de `CatBreedUseCase`:
- ✅ Obtener lista de razas correctamente
- ✅ Manejar errores de repositorio
- ✅ Manejar lista vacía

### Tests de Widgets
```bash
flutter test
```

**Tests de DetailWidget** (9 tests):
- ✅ Mostrar nombre de la raza
- ✅ Mostrar descripción
- ✅ Mostrar origen
- ✅ Mostrar rating de inteligencia
- ✅ Mostrar rating de adaptabilidad
- ✅ Mostrar esperanza de vida
- ✅ Manejar imágenes con error
- ✅ Renderizar con valores null
- ✅ Contenido scrolleable

**Tests de LandingWidget** (10 tests):
- ✅ Mostrar campo de búsqueda
- ✅ Mostrar ícono de búsqueda
- ✅ Mostrar lista de razas
- ✅ Manejar lista vacía
- ✅ Callback de búsqueda
- ✅ Callback de toque
- ✅ Número correcto de items
- ✅ Hint text del campo
- ✅ Scroll en listas largas
- ✅ Padding y espaciado

**Tests de CatBreedCard** (13 tests):
- ✅ Mostrar nombre
- ✅ Mostrar label "más info"
- ✅ Mostrar imagen
- ✅ Mostrar origen
- ✅ Mostrar inteligencia
- ✅ Renderizar Card
- ✅ Callback onTap
- ✅ Manejo de error de imagen
- ✅ ClipRRect para bordes
- ✅ Padding interno
- ✅ Row con nombre e info
- ✅ Renderizar con nulls
- ✅ SizedBox con ancho infinito

**Total: 32 tests** ✅

## 📦 Dependencias Principales

```yaml
# Framework
flutter: SDK
flutter_riverpod: ^3.2.1  # Manejo de estado

# Inyección de Dependencias
get_it: ^8.2.0
injectable: ^2.5.1

# Internacionalización
flutter_localizations: SDK
intl: ^0.20.0

# Dev Dependencies
flutter_test: SDK
build_runner: ^2.4.15
injectable_generator: ^2.8.1
```

## 🌍 Internacionalización

La aplicación soporta:
- 🇬🇧 English (en)
- 🇪🇸 Español (es)

Los archivos de traducción se encuentran en:
- `lib/l10n/app_en.arb`
- `lib/l10n/app_es.arb`

Para generar las clases de localización:
```bash
flutter gen-l10n
```

## 🔄 Flujo de Datos

```
UI (Widgets)
    ↓
Riverpod Providers
    ↓
Use Cases (Domain)
    ↓
Repositories (Domain)
    ↓
Infrastructure (Datasources)
    ↓
API / Local Data
```

## 🎨 Modelos de Datos

### CatBreed
```dart
class CatBreed {
  final String? id;
  final String? name;
  final String? description;
  final String? origin;
  final int? intelligence;      // 1-5
  final int? adaptability;      // 1-5
  final String? lifeSpan;
  final String? imageUrl;
}
```

### Result (Either Pattern)
```dart
class Result<L, R> {
  final L? left;   // Error
  final R? right;  // Éxito
  
  bool get isLeft => left != null;
  bool get isRight => right != null;
}
```

### Failures
```dart
abstract class Failure {}
class NetworkFailure extends Failure {}
class ServerFailure extends Failure {
  final String? technicalMessage;
}
```

## 🚀 Comandos Útiles

```bash
# Obtener dependencias
flutter pub get

# Generar código (DI, localización, etc)
dart run build_runner build
dart run build_runner watch    # Watch mode

# Ejecutar tests
flutter test                    # Todos los tests
flutter test test/detail_widget_test.dart
dart test modules/domain/test/cat_breed_use_case_test.dart

# Análisis estático
dart analyze

# Formatear código
dart format lib test

# Limpiar build
flutter clean
```

## 📝 Testing Builder Pattern

El proyecto incluye `CatBreedTestBuilder` para facilitar la creación de datos de prueba:

```dart
final catBreed = CatBreedTestBuilder()
  .withId('1')
  .withName('Persian')
  .withIntelligence(4)
  .withAdaptability(5)
  .build();
```

## 🎯 Validaciones

### CatBreed
- `intelligence`: Debe estar entre 1 y 5
- `adaptability`: Debe estar entre 1 y 5
- Lanza `ArgumentError` si no cumple

## 📱 Plataformas Soportadas

- ✅ Android
- ✅ iOS
- ⚠️ Web (requiere configuración adicional)

## 🤝 Contribuir

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Ver archivo LICENSE para más detalles.

## 👨‍💻 Autor

Hector Alvarez

## 📞 Soporte

Para reportar bugs o sugerencias, abre un issue en el repositorio.

---

**Última actualización**: Febrero 2026
**Estado del proyecto**: Desarrollo
**Cobertura de tests**: 32 tests pasando
