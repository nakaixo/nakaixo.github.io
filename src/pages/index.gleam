import components/header
import gleam/list
import nakai/attr
import nakai/html
import pages/base

const example = "html.div_text([], \"Hello, Lucy!\")
|> nakai.to_string()
|> file.write(\"index.html\")"

pub fn page() {
  let prose = [
    #("Run into a bug?", "Report it!", [
      attr.href("https://github.com/nakaixo/nakai/issues"),
    ]),
    #("Want to contribute?", "Please do!", [
      attr.href("https://github.com/nakaixo/nakai"),
    ]),
    #("Looking for our documentation?", "Over here!", [
      attr.href("https://hexdocs.pm/nakai/"),
    ]),
  ]

  let make_prose = fn(details) {
    let #(question, answer, attrs) = details
    html.p([], [html.Text(question), html.Text(" "), html.a_text(attrs, answer)])
  }

  base.document([
    header.default("Nakai."),
    html.div([], [
      html.p_text([], "A library for generating HTML with Gleam ✨"),
      html.pre([], [html.code_text([attr.class("language-gleam")], example)]),
      html.Fragment(
        prose
        |> list.map(make_prose),
      ),
    ]),
  ])
}
