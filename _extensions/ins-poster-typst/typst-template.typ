
// This is an example typst template (based on the default template that ships
// with Quarto). It defines a typst function named 'article' which provides
// various customization options. This function is called from the 
// 'typst-show.typ' file (which maps Pandoc metadata function arguments)
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-show.typ' entirely. You can find 
// documentation on creating typst templates and some examples here: 
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates

#let poster(
  // The poster's size.
  size: "'36x24' or '48x36''",

  // The poster's title.
  title: "Paper Title",

  subtitle: "Paper subtitle",

  // A string of author names.
  authors: "Author Names (separated by commas)",

  // Department name.
  departments: "Department Name",

  // header color



  // Footer text.
  // For instance, Name of Conference, Date, Location.
  // or Course Name, Date, Instructor.
  footer_text: "Footer Text",

  // Any URL, like a link to the conference website.
  footer_url: "Footer URL",

  // Email IDs of the authors.
  footer_email_ids: "Email IDs (separated by commas)",

  // Color of the footer.
  footer_color: "Hex Color Code",

  // DEFAULTS
  // ========
  // For 3-column posters, these are generally good defaults.
  // Tested on 36in x 24in, 48in x 36in, and 36in x 48in posters.
  // For 2-column posters, you may need to tweak these values.
  // See ./examples/example_2_column_18_24.typ for an example.

  // Any keywords or index terms that you want to highlight at the beginning.
  keywords: (),

  // Number of columns in the poster.
  num_columns: "1",

  // University logo's scale (in %).
  univ_logo_scale: "100",

  // University logo's column size (in in).
  univ_logo_column_size: "4",

  // Title and authors' column size (in in).
  title_column_size: "20",

  // Poster title's font size (in pt).
  title_font_size: "68",

  // Authors' font size (in pt).
  authors_font_size: "40",

  // Footer's URL and email font size (in pt).
  footer_url_font_size: "30",

  // Footer's text font size (in pt).
  footer_text_font_size: "40",

  body

) = {


  // configure page display to match unibasel poster size
// portrait mode, A0
set page(
  paper: "a0", 
  columns: 1,
  margin: (
    top: 5in,
    left: 1.8in, 
    right: 1.8in, 
    bottom: 2in),
  header: align(center, 
                rect(fill: rgb(165, 215, 210), 
                     width: 120%,
                     height: 100%,
                     grid(rows: 1, 
                          columns: (7%, 20%, 50%, 19%),
                          fill: rgb(165, 215, 210),
                          grid.cell(
                            align: right + horizon,
                            colspan: 2, 
                            inset: 30pt,
                             image("./_extensions/ins-poster-typst/logo-unibas-left-en.png")
                          ),
                          grid.cell(
                            align: right + horizon,
                            colspan: 2,
                            inset: 30pt,
                            image("./_extensions/ins-poster-typst/logo-ins-right.png", width: 25%)
                          )
                        )
                      )
                   ),
  header-ascent: 10%,
  footer: align(center, 
                rect(fill: none, // rgb(210, 5, 55),
                     width: 120%, 
                     height: 100%,
                     stroke: none,
                     inset: 30pt)[
                    #text(footer_email_ids)
                   ]
                   ),
  footer-descent: 20%,
)

// configure text sizes and numbering according to University of Basel
// styleguide
set text(font: "Arial", size: 44pt)

set heading(numbering: none)
show heading.where(level: 1): set text(size: 54pt, weight: "bold")
show heading.where(level: 2): set text(size: 50pt, weight: "bold")
show heading.where(level: 3): set text(size: 46pt, weight: "bold")

align(center, 
    block(width: 100%, 
          inset: 20pt,
          fill: none, 
          (
            text(title + "\n", 
                 size: 72pt, 
                 font: "Georgia", 
                 weight: "bold") + 
            text(subtitle + "\n", 
                size: 64pt, 
                font: "Georgia", 
                weight: "bold") + 
            text(authors,
                 size: 54pt,
                 font: "Georgia") + 
            text("\n(" + departments + ")",
                 size: 38pt,
                 font: "Georgia")
           )
          )
       )

  // Display the poster's contents.
  body
}
