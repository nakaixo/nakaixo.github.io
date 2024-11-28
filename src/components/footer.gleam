import gleam/list
import nakai/attr
import nakai/html

pub fn default() {
  let links = [
    #("Home", [attr.href("/")]),
    #("Docs", [attr.href("https://hexdocs.pm/nakai/")]),
    #("Github", [attr.href("https://github.com/nakaixo")]),
    #("Discord", [
      attr.href("https://discord.gg/Fm8Pwmy"),
      attr.title("It's just the Gleam Discord :p"),
    ]),
  ]

  let make_link = fn(details) {
    let #(name, attrs) = details
    html.li([], [html.a_text(attrs, name)])
  }

  html.footer([attr.class("footer")], [
    html.span_text([], "Made with 💕 by queer people 🏳️‍🌈"),
    html.ul(
      [attr.class("footer-links")],
      links
        |> list.map(make_link),
    ),
  ])
}
