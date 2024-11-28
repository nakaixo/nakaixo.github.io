import components/footer
import nakai/attr
import nakai/html.{type Node}

pub fn document(children: List(Node)) {
  html.Fragment([
    html.Head([
      html.title("Nakai. ✨"),
      html.meta([attr.name("viewport"), attr.content("initial-scale=1")]),
      html.link([
        attr.rel("preload"),
        attr.crossorigin("anonymous"),
        attr.as_("font"),
        attr.type_("font/woff2"),
        attr.href("https://fonts.mckayla.cloud/Nunito.woff2"),
      ]),
      html.link([
        attr.rel("preload"),
        attr.crossorigin("anonymous"),
        attr.as_("font"),
        attr.type_("font/woff2"),
        attr.href("https://fonts.mckayla.cloud/Neuton-Regular.woff2"),
      ]),
      html.link([
        attr.rel("shortcut icon"),
        attr.href(
          "https://cdn.mckayla.cloud/-/f648cf5b6eee40b2982410757909716e/favicon.ico",
        ),
      ]),
      html.link([attr.rel("stylesheet"), attr.href("/index.css")]),
      html.link([
        attr.rel("stylesheet"),
        attr.href("https://unpkg.com/prismjs@1/themes/prism.min.css"),
      ]),
      html.Script(
        [attr.src("https://unpkg.com/prismjs@1/components/prism-core.min.js")],
        "",
      ),
      html.Script([attr.src("https://unpkg.com/prismjs-gleam@1/gleam.js")], ""),
      html.Script(
        [
          attr.src(
            "https://unpkg.com/prismjs@1/components/prism-autoloader.min.js",
          ),
        ],
        "",
      ),
    ]),
    html.img([
      attr.class("cover-image"),
      attr.src(
        "https://cdn.mckayla.cloud/-/f648cf5b6eee40b2982410757909716e/Nakai-Background.svg",
      ),
    ]),
    html.div([attr.class("cover-gradient")], []),
    html.div([attr.class("container")], [
      html.Fragment(children),
      footer.default(),
    ]),
  ])
}
