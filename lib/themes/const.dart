import 'package:bodas/routes/linkspaper.dart';

//Images constants
const logo = "assets/logo.png";
const background = "assets/images/Perlin2.png";
const back2 = "assets/images/bck.png";

//sponsors
const bose = "assets/sponsors/marquee-audiovisuales-logotipo-bose.jpg";
const briteq = "assets/sponsors/marquee-audiovisuales-logotipo-briteq.jpg";
const christie = "assets/sponsors/marquee-audiovisuales-logotipo-christie.jpg";
const dbtechnologies =
    "assets/sponsors/marquee-audiovisuales-logotipo-dbtechnologies.jpg";
const model1 = "assets/sponsors/marquee-audiovisuales-logotipo-model1.jpg";
const panasonic =
    "assets/sponsors/marquee-audiovisuales-logotipo-panasonic.jpg";
const pioneerdj =
    "assets/sponsors/marquee-audiovisuales-logotipo-pioneerdj.jpg";
const sennheiser =
    "assets/sponsors/marquee-audiovisuales-logotipo-sennheiser.jpg";
const twaudio = "assets/sponsors/marquee-audiovisuales-logotipo-twaudio.jpg";
const spons = "assets/sponsors/spons.png";

//images
const img1 = 'assets/images/img1.png';
const img2 = 'assets/images/img2.png';
const img3 = 'assets/images/img3.png';

const bod1 = 'assets/images/bod1.png';
const bod2 = 'assets/images/bod2.png';
const bod3 = 'assets/images/bod3.png';
const bod4 = 'assets/images/bod4.png';
const pizarra = 'assets/images/pizarra.png';

//social media
const insta = 'assets/images/inst.svg';
const face = 'assets/images/face.svg';
const tiktok = 'assets/images/tiktok.svg';
const youtube = 'assets/images/youtube.png';
const spotify = 'assets/images/spotify.png';

//carrousel
const frame2 = 'assets/images/frame2.png';
const frame1 = 'assets/images/frame1.png';

//images Carousel
const f1 = 'assets/images/f1.png';
const f2 = 'assets/images/f2.png';
const f3 = 'assets/images/f3.png';
const f4 = 'assets/images/f4.png';
const f5 = 'assets/images/f5.png';
const f6 = 'assets/images/f6.png';
const f7 = 'assets/images/f7.png';
const f8 = 'assets/images/f8.png';
const f9 = 'assets/images/f9.png';
const f10 = 'assets/images/f10.png';
const f11 = 'assets/images/f11.png';
const f12 = 'assets/images/f12.png';

const port1 = 'assets/images/Port1.png';
const port2 = 'assets/images/Port2.png';

const spain = 'assets/images/iconSpain.png';
//colors
const white = Colors.white70;
const black = Colors.black87;
const grey = Color(0x7A9E9E9E);

//Para depurar
const title1 = 'Alquiler de equipos audiovisuales para bodas';
const title2 = '¿Quiénes Somos?';
const title3 = "Bodas";
const title4 = "Lo que dicen de nosotros";
const title5 = "Conoce mas sobre nosotros";
const notFoundOpinions = "No se encontraron Opiniones";
const review =
    'En el día más importante de sus vidas, transformamos su boda mediante el diseño e instalación de equipos audiovisuales de alta calidad. Ofrecemos asesoría integral, planificación musical, así como la contratación de artistas, DJs, equipos de sonido, iluminación y escenarios que estén a la altura de tan importante celebración.';

//video
final video = "https://vokwhcnpfzotvuvggjdt.supabase.co/storage/v1/object/public/videospromos//video.mp4";

// Colors
class AppColors {
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const lightGrey = Color(0xFFECECEC);
  static const darkGrey = Color(0xFF363636);
  static const mediumGrey = Color(0xFFA1A1A1);
  static const textDarkGrey = Color(0xFF2A2A2A);
  static const textMediumGrey = Color(0xFF3F3F3F);
  static const buttonBackground = Color(0x94020000);

  // Text colors
  static const Color primaryText = Colors.black;
  static const Color secondaryText = Color(0xFF888888);
}

// Text Styles
class AppTextStyles {
  static const navLinkStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 0.6,
  );

  static const formLabelStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textMediumGrey,
  );

  static const buttonTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.lightGrey,
  );

  static const passwordHintStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static const footerTextStyle = TextStyle(
    fontFamily: 'Metrophobic',
    fontSize: 22,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.66,
    height: 2.0,
    color: AppColors.black,
  );
}

// Dimensions
class AppDimensions {
  static const double formWidth = 469;
  static const double logoWidth = 309;
  static const double buttonWidth = 189;
  static const double formPaddingHorizontal = 45;
  static const double formPaddingVertical = 22;
}

//Lista de opiniones para CardRated

List<CardRated> reviews = [
  CardRated(author: "Esperanza", img: bod1, date: "30/04/2025", rate: "5.0", description: "Boda absolutamente épica gracias a Aitor. Desde que nos pusimos en contacto con él, una persona cercana y que tuvo en cuenta todas nuestras preferencias para que la boda fuera un éxito. El día de la boda, atento y adaptando la música para que en todo momento no se parara de bailar. Nuestros amigos no recuerdan una boda como la nuestra y parte fue gracias a Aitor. Si nos volviéramos a casar estarías en nuestro equipo! Gracias por ponerle música a los mejores momentos de nuestra boda"),
  CardRated(author: "Irene", img: bod1, date: "29/04/2025", rate: "5.0", description: "Tuvimos la suerte de que Angel fuese el DJ de nuestra boda y fue el mejor!! Supo exactamente que tipo de musica poner en cada momento y la gente (y por supuesto nosotros, los novios) estuvimos sin parar de bailar durante toda la barra libre. De 10!!!! "),
  CardRated(author: "Luis", img: bod1, date: "14/04/2025", rate: "5.0", description: " Tuvimos a Adri (https://linktr.ee/dimelobeta) para la ceremonia de nuestra boda el 12/04/2025, en Jardines de San Telmo.Se adaptó perfectamente a nuestro estilo de boda que era mix de música argentina, internacional y española, supo combinar perfectamente los estilos y le puso muy buena onda. Estamos encantados!"),
  CardRated(author: "Pablo", img: bod1, date: "09/04/2025", rate: "5.0", description: "Adrian, tambien llamado artísticamente “dimelobeta” ha sido clave en que nuestra boda fuese un éxito. Desde el primer momento super atento, tanto él, como todo su equipo de Marqueé audiovisuales meses antes de la boda. Adri, supo leer en todo momento lo que queríamos. En la ceremonia, coctail y banquete cuadró todo perfectamente. Pero ya en la fiesta… fue sublime. El entarimado con el dj justo en la sala es un plus y la gente lo agradeció. Todos los invitados se sintieron mucho más integrados y la variedad musical y mezclas fue de auténtico profesional. Pd. Además tuvo el generoso detalle de hacernos un vídeo-resumen de todos los momentos bonitos del día. Sencillamente un crack, 100% recomendable "),
  CardRated(author: "Miriam", img: bod1, date: "31/03/2025", rate: "5.0", description: "Repetiría una y mil veces más una boda como la nuestra con Marquee audiovisuales, en especial con Germán! Fue una experiencia inolvidable. Muchas gracias por todo !!!! "),
  CardRated(author: "Miguel", img: bod1, date: "16/03/2025", rate: "5.0", description: "Durante todo el proceso de contratación y organización de la música de nuestra boda, estuvimos en contacto con todo el equipo de Marquee audiovisuales. Conseguimos que todo se adaptará a nuestras necesidades y que el presupuesto estuviera ajustado sin renunciar a calidad y profesionalidad. Nuestro DJ fue DJ Pepe y, tras mantener una reunión los días antes con él, todo salió perfecto. Pedimos una hora extra de barra libre porque estaba siendo un fiestón."),
  CardRated(author: "María", img: bod1, date: "06/03/2025", rate: "5.0", description: "Mi boda fue el 28 de febrero, y Adrián fue el DJ que estuvo ahí. La gente no paro de bailar y él de animar la fiesta sin parar. Fue una fiesta como la que queríamos....que días después los invitados la recordásen. En resumen...... increíble!!!! "),
  CardRated(author: "Rocío", img: bod1, date: "27/02/2025", rate: "5.0", description: "Excelente trabajo. Le propusimos hacer un bingo y no puso problema, al contrario. Nos ayudó a elegir el momento perfecto para darle los regalitos a nuestras madres. Nos llamó y estuvimos repasando las canciones para cada momento. Super atento a nosotros en cada momento y muy divertido. Adrián, no olvidaremos este día y su banda sonará. Gracias 😊"),
  CardRated(author: "Adrián", img: bod1, date: "25/02/2025", rate: "5.0", description: " Muchas gracias a Adrián nuestro DJ, siempre atento y dispuesto. Un trabajo muy profesional, incluso ha tenido un detalle con nosotros, sin duda volveríamos a elegirlo a él."),
  CardRated(author: "Teresa", img: bod1, date: "20/02/2025", rate: "5.0", description: "DJ Pepe fue increíble música variada y ambiente perfecto. 100% recomendable"),
  CardRated(author: "Lidia", img: bod1, date: "25/02/2025", rate: "5.0", description: "Fue sencillo trabajar con Maequee pre-boda y el resultado en el día clave fue Excelente. No sabemos quién se lo pasó mejor. Nosotros lo pasamos de 10, los invitados lo pasaron de 10 pero es que Dj Adrián / @dimelobeta estaba pletórico, no paró de poner temazo tras temazo. Nuestros pies lo han sufrido pero nos ha dejado a todos el corazón contento. Por supuesto, muy recomendable."),
  CardRated(author: "Lourdes", img: bod1, date: "27/01/2025", rate: "5.0", description: "Teníamos unas expectativas altísimas por los comentarios que habíamos leído sobre Aitor y por lo bien que nos había tratado en las reuniones previas, y aunque parecía difícil, las superó con creces. No es simplemente alguien que pone música, es un auténtico avión creando el ambiente y la fiesta a tu medida. Tiene una capacidad impresionante para leer a la gente, saber lo que les gusta y conseguir que todo el mundo se lo pase genial. Se nota su experiencia en bodas de todo tipo y se adaptó perfectamente tanto a lo que queríamos nosotros como a lo que pedía la fiesta en cada momento, además nos dio consejos buenísimos que marcaron la diferencia."),
  CardRated(author: "María", img: bod1, date: "08/01/2025", rate: "5.0", description: "Elegir a Aitor como Dj de nuestra boda fue la mejor elección! Hizo que la boda fuese perfecta y los invitados se lo pasaran de maravilla, lo más comentado de la boda ha sido la fiesta, los temazos y el buen rollo que se creó gracias a él. Sin duda lo recomiendo 100%!!"),
  CardRated(author: "Marta", img: bod1, date: "31/12/2024", rate: "5.0", description: "Tuvimos suerte cuando Ángel Medina Dj fue el elegido para nuestra boda. Se prestó a todo y estuvo pendiente de todos los momentos especiales. Gracias"),
  CardRated(author: "Adrián", img: bod1, date: "30/01/2025", rate: "5.0", description: "Fue increíble poder contar con Marquee Audiovisuales. Hicieron realidad todo lo que teníamos en mente y consiguieron hacer que la fiesta fuese de ensueño. Hicieron que nuestra boda tuviese los momentos más especiales y únicos que uno se pueda imaginar. Los recomendamos por encima de todas las cosas y repetiríamos ese día una y mil veces."),
  CardRated(author: "Lydia", img: bod1, date: "20/12/2024", rate: "5.0", description: "Fue todo un acierto desde el principio, la conexión que sentimos y la sinergia no se puede explicar ... siempre preparado para darlo todo, animando a la gente hasta el final y remontando la fiesta cuando más falta hacía. Nuestra boda no hubiese sido lo mismo sin él, la recordaremos por siempre al igual que cada uno de los momentos especiales que tuvimos. Gracias Aitor por ser la banda sonora de nuestra comedia romántica, vivimos un sueño que jamás olvidaremos."),
  CardRated(author: "Alicia", img: bod1, date: "13/12/2024", rate: "5.0", description: "Antes de saber que la hacienda trabajada con ellos yo ya había visto a Aitor por redes sociales y dije, yo si me caso necesito a este señor en mi vida.Y qué razón tenía, pedazo de DJ. Nos ha creado la mejor fiesta de nuestra vida. No lo cambiamos por nada del mundo."),
  CardRated(author: "Javier", img: bod1, date: "05/12/2024", rate: "5.0", description: "Cristina y yo los casamos el día 30 y la verdad que solo podemos decir que menudo fiestón nos prepararon Javi Carrera y Aitor, nos lo dijeron todos los invitados! Solo agradecer el trato dado por vosotros y el magnífico trabajo que hicieron!"),
  CardRated(author: "Violeta", img: bod1, date: "02/12/2024", rate: "5.0", description: "Voy a dejar por aquí mis votos al señor Aitor, porque una reseña es algo impersonal y Aitor te hace sentir tsn especial desde el minuto 1 qué sólo se merece una declaración de amor. Aitor, mil gracias por hacer de un día cualquier el día más especial de mi vida, gracias por poner todo tu corazón en nuestra boda y gracias por estar siempre qué te hemos necesitado. Gracias también por hacer de una idea, un sueño y de un sueño una realidad, si me volviera a casar te diría sí 10000000 veces más 🫂 Te queremos Juan y Violeta ❤️"),
];
