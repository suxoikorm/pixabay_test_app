### პროექტის შესახებ

ამ სატესტო პროექტში მე წავშალე `windows`, `macos`, `linux` და `web` ფოლდერები, რადგან ისინი ამ დავალებებისთვის საჭირო არ არის.

#### უსაფრთხოება
API Key შესანახად ვიყენებ `.env` ფაილს და `envied` პაკეტს.

#### Pixabay API-ს მახასიათებლები
Pixabay API-ში არ არის ველი `favorites`, ამიტომ მე ის `collections`-ით შევცვალე, რათა მსგავსი ფუნქციონალობა განმეხორციელებინა.

### ქსელური მოთხოვნები

ქსელთან სამუშაოდ ვიყენებ `DioContainer`-ს, რომელიც არის `dio` პაკეტი. იგი საშუალებას მაძლევს ერთ ადგილას განვსაზღვრო ძირითადი პარამეტრები (მაგალითად, ძირითადი URL და სათაურები), და შემდეგ `DioProviderMixin`-ის საშუალებით, ეს პარამეტრები გამოვიყენო ნებისმიერ რეპოზიტორში.

### ნავიგაცია

აპლიკაციაში ნავიგაციისთვის ვიყენებ `auto_route`-ს. ასევე ვიყენებ `AutoRouteGuard`-ს, რომ არაუტორიზებულ მომხმარებლებს შიდა გვერდზე შესვლა ვერ შესძლოს.

### Dependency Injection (DI)

დამოკიდებულებების მართვისთვის ვიყენებ `get_it`-ს `injectable` პაკეტთან ერთად, რომელიც საშუალებას მაძლევს ავტომატურად დავარეგისტრირო დამოკიდებულებები.

### მიდგომები და მოქნილობა

ამ პროექტში გამოვიყენე სხვადასხვა ტექნიკა — `Cubit`, `Bloc`, `dio`, `auto_route`, `injectable` და სხვები — ვაჩვენო ჩემი შესაძლებლობები. თუმცა, ყოველთვის მზად ვარ მოვერგო გუნდის მოთხოვნებს ან მივიღო მონაწილეობა განხილვებში, რათა ერთობლივად ვიპოვოთ საუკეთესო გადაწყვეტილება თითოეული დავალებისთვის.

### პროექტის სტრუქტურა

- **`lib/app`** — აპლიკაციის ძირითადი ლოგიკა, AppState და ნავიგაცია.
- **`lib/features`** — აქ განთავსებულია აპლიკაციის ფუნქციები.
  - **`features/auth`** — ავტორიზაციის მოდული. მე გამოვიყენე `Cubit`, და წარმატებული ავტორიზაციის შემდეგ ხორციელდება ურთიერთქმედება `AppStore`-თან.
  - **`features/photos`** — მოდული ფოტოების ატვირთვისა და ჩვენებისთვის. აქ ვიყენებ კლასიკურ `Bloc`-ს `Equatable`-თან ერთად.
- **`lib/utils`** — აქ განთავსებულია სასარგებლო ინსტრუმენტები, მაგალითად, ველების ვალიდაციისთვის.
