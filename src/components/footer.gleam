import gleam/list
import nakai/html
import nakai/attr

const footer_style = "
  color: #999;
  padding-top: 192px;
  font-size: 18px;
"

const link_list_style = "
  list-style-type: none;
  padding-left: 0;
  display: flex;
  flex-direction: row;
  gap: 24px;
"

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

  html.footer([attr.style(footer_style)], [
    html.span_text([], "Made with 💕 by queer people 🏳️‍🌈"),
    html.ul(
      [attr.style(link_list_style)],
      links
        |> list.map(make_link),
    ),
  ])
}
