# animeProyectoFinal
Este proyecto está creado desde cero para aprender la creación de una aplicación.

Arquitectura:
- MVVM

Patrones de diseño usados:
- Singleton


Funcionalidades añadidas:
- Login
- HomeAnime: CollectionView donde se muestran los 25 primeros animes
- DetailAnime: Vista en la que se muestran todos los detalles de un anime 
específico
- RootView: Clase usada para realizar la navegación entre las vistas
- HomeManga: CollectionView donde se muestran los 25 primeros mangas
- DetailManga: Vista en la que se muestran todos los detalles importantes 
de un manga específico
- TabBar: View principal, en ella recoge tanto TopAnimes como TopMangas, 
abierta a posibles cambios
- Settings View: Clase en la que encontramos diferentes ajustes de la 
aplicación.

Llamadas a APIs usada: 
- GET https://api.jikan.moe/v4/top/anime
- GET https://api.jikan.moe/v4/top/manga

Funcionalidades testadas:
- Login:
	- func onLogin: Se testaron tanto los casos de error como los 
casos en los que sale correcto.
- RemoteDataSourceAnime:
	- Testada la llamada con Async await
-RemoteDataSourceManga:
	- Testada la llamada con Async await
- AnimeRepository:
	- Testado el mapeo de dato DTO a DO
