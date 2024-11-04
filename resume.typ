#let resume(
  author: "",
  location: "",
  email: "",
  github: "",
  linkedin: "",
  phone: "",
  personal-site: "",
  accent-color: "#000000",
  font: "New Computer Modern",
  img: "",
  about:"",
  body,
) = {

  // Sets document metadata
  set document(author: author, title: author)

  // Document-wide formatting, including font and margins
  set text(
    // LaTeX style font
    font: font,
    size: 10pt,
    lang: "en",
    // Disable ligatures so ATS systems do not get confused when parsing fonts.
    ligatures: false
  )

  // Reccomended to have 0.5in margin on all sides
  set page(
    margin: (0.5in),
    "us-letter",
  )


  // Link styles
  show link: underline


  // Small caps for section titles
  show heading.where(level: 2): it => [
    #pad(top: 0pt, bottom: -10pt, [#smallcaps(it.body)])
    #line(length: 100%, stroke: 1pt)
  ]

  // Accent Color Styling
  show heading: set text(
    fill: rgb(accent-color),
  )

  show link: set text(
    fill: rgb(accent-color),
  )

  // Name will be aligned left, bold and big
  show heading.where(level: 1): it => [
    #set align(left)
    #set text(
      weight: 700,
      size: 20pt,
    )
    #it.body
  ]
  

  // Personal Info
  pad(
    top: 0.25em,
    grid(
  columns: (5fr, 1fr),
  gutter: 10pt,
    align(left)[
      = #(author)
      
      #(
        (
          if phone != "" {
            phone
          },
          if location != "" {
            location
          },
          if email != "" {
            link("mailto:" + email)[#email]
          },
          if github != "" {
            link("https://" + github)[#github]
          },
          if linkedin != "" {
            link("https://" + linkedin)[#linkedin]
          },
          if personal-site != "" {
            link("https://" + personal-site)[#personal-site]
          },
        ).filter(x => x != none).join("  |  ")
      ) 
      \
      \
      #h(15pt)
      #about
    ],
    align(right)[#img]
    )
  )
  

  // Main body.
  set par(justify: true)

  body
}

// Generic two by two component for resume
#let generic-two-by-two(
  top-left: "",
  top-right: "",
  bottom-left: "",
  bottom-right: "",
) = {
  pad[
    #top-left #h(1fr) #top-right \
    #bottom-left #h(1fr) #bottom-right
  ]
}

// Generic one by two component for resume
#let generic-one-by-two(
  left: "",
  right: "",
) = {
  pad[
    #left #h(1fr) #right
  ]
}

// Cannot just use normal --- ligature becuase ligatures are disabled for good reasons
#let dates-helper(
  start-date: "",
  end-date: "",
) = {
  start-date + " " + $dash.em$ + " " + end-date
}

// Section components below
#let edu(
  institution: "",
  dates: "",
  degree: "",
  gpa: "",
  location: "",
) = {
  generic-two-by-two(
    top-left: strong(institution),
    top-right: location,
    bottom-left: emph(degree),
    bottom-right: emph(dates),
  )
}

#let work(
  title: "",
  dates: "",
  company: "",
  location: "",
) = {
  generic-two-by-two(
    top-left: strong(title),
    top-right: dates,
    bottom-left: company,
    bottom-right: emph(location),
  )
}

#let project(
  role: "",
  name: "",
  url: "",
  dates: "",
) = {
  pad[
    *#role*, #name (#link("https://" + url)[#url]) #h(1fr) #dates
  ]
}

#let extracurriculars(
  activity: "",
  dates: "",
) = {
  generic-one-by-two(
    left: strong(activity),
    right: dates,
  )
}

// Put your personal information here, replacing mine
#let name = "Плютто Андрей"
#let location = "Москва, Россия"  
#let email = "pluttan@ya.ru"
#let github = "github.com/pluttan"
#let phone = "+7 (985) 110-83-85"
#let linkedin = "t.me/pluttanru"
#let about = [
 Здравствуйте! Меня зовут Андрей, я студент старших курсов МГТУ им. Баумана. Ищу смешанную или удаленную работу в IT индустрии. Интересуют вакансии _Junior frontend/backend разработчика_, _программиста микроконтроллеров_, _инженера FPGA_. Лучшими своими качествами я считаю целеустремленность и быструю обучаемость. Если вас заинтерисовала моя анкета свяжитесь со мной.
]

#show: resume.with(
  author: name,
  location: location,
  email: email,
  github: github,
  linkedin: linkedin,
  phone: phone,
  accent-color: "#7287fd",
  font: "New Computer Modern",
  img: image("photo.png"),
  about: about
)

== Образование

#edu(
  institution: "Московский государственный технический университет имени Н. Э. Баумана",
  location: "Москва, Россия",
  dates: dates-helper(start-date: "2022", end-date: "2026"),
  degree: "Информатика и вычислительная техника",
)
- *Математические дисциплины*: Математический анализ, Интегралы и диференциальные уравнения уравнения, Теория вероятности, Дискретная математика, Теория автоматов 
- *Инженерные дисциплины*: Инженерная графика, Физика, Электротехника, Электроника, Схемотехника
- *Системное администрирование*: Операционные системы (Linux/bash), Сети
- *Программирование*: Основы программирования (Pascal/Delphi), Объектно ориентированное программиорование (C/C++/Qt), Машинно-зависимые языки (NASM/MASM), Разработка программных систем

#edu(
  institution: "Колледж архитектуры, дизайна и реинжиниринга 26 кадр",
  location: "Москва, Россия",
  dates: dates-helper(start-date: "2020", end-date: "2021"),
  degree: "Оператор электронно-вычислительных машин",
)

== Опыт работы

#work(
  title: "Программист микроконтроллеров",
  location: "",
  company: [Разрабатывал алгоритмы под _ПЛИС_, программы для микроконтроллера _STM32_],
  dates: "2023",
)


== Проекты

- *POV-голограмма*: Из-за эффекта персистенции зрения человек может определить быстродвижущийся $n$-мерный объект за статичный ($n+1$)-мерный. Так, если быстро изменять картинку и положение двухмерного дисплея можно созать эффект трехмерного.
- *Освещение помещений*: Дневной свет оказывает положительное воздействие на жизнедеятельность человека, но когда такого света мало, можно смешивать его с цветами RGB-лент, похожих по гамме.
- *Семейное древо*: Сайт, для интерактивного построения семейного древа на React.
- *Библиотека по отрисовке и моделированию логических элеметов*: Мультиязыковая библиотека, помогающая схемотехникам нарисовать любой логический блок.

== Стек технологий

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  [
    === Схемотехника и микроэлектроника	
    - Verilog
    - Multisim, Microcap
    - EasyEDA
    - Программирование микро-\ контроллеров семейств\  Altera, STM32 (регистры + HAL), ESP32, ESP8266
  ],[
    === Программирование
    - NASM x86/64
    - C, C++
    - Qt5
    - Pascal, Delphi
    - Ruby, Ruby on rails
    - JS, TS (+ Языки разметки, CSS, SCSS)
    - React
    - Python
  ],[
    === Остальное
    - Typst, LaTeX, Markdown
    - Notion, Weeek
    - Linux, shell
    - SQL, PostgresSQL, MySQL
    - Git, Github (+ci/cd)
  ]
)