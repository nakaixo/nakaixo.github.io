import gleam/string
import nakai/html.{type Node}
import nakai/attr
import components/footer

const body_style = "
  font-family: 'Nunito', sans-serif;
  margin: 0;
"

const cover_image_style = "
  position: relative;
  z-index: -2;
  width: 100vw;
  height: 50vh;
  object-fit: cover;
  user-select: none;
"

const cover_gradient_style = "
  position: absolute;
  left: 0;
  top: 0;
  z-index: -1;
  width: 100vw;
  height: 50vh;
  object-fit: cover;
  user-select: none;
  background-image: linear-gradient(
    0deg,
    rgb(255 255 255 / 0.6) 0%,
    rgb(255 255 255 / 0.4) 20%,
    rgb(255 255 255 / 0) 50%,
    rgb(255 255 255 / 0)
  );
  box-shadow: 0 0 36px #0002;
"

const container_style = "
  max-width: 900px;
  margin: auto;
  margin-top: -300px;
  padding: 24px;
"

pub fn document(children: List(Node)) {
  html.Fragment([
    html.Head([
      html.title("Nakai. ✨"),
      // html.link([attrs.rel("stylesheet"), attrs.href("/style.css")]),

      html.link([
        attr.rel("stylesheet"),
        attr.href("https://unpkg.com/prismjs@1.29.0/themes/prism.min.css"),
      ]),
      metadata(),
    ]),
    html.Body([attr.style(body_style)], [
      html.img([
        attr.style(cover_image_style),
        attr.src(
          "https://cdn.mckayla.cloud/-/f648cf5b6eee40b2982410757909716e/Nakai-Background.svg",
        ),
      ]),
      html.div([attr.style(cover_gradient_style)], []),
      html.div([attr.style(container_style)], [
        html.Fragment(children),
        footer.default(),
      ]),
      html.Element(
        "script",
        [
          attr.src(
            "https://unpkg.com/prismjs@1.29.0/components/prism-core.min.js",
          ),
        ],
        [],
      ),
      html.Element(
        "script",
        [attr.src("https://unpkg.com/prismjs-gleam@1/gleam.js")],
        [],
      ),
      html.Element(
        "script",
        [
          attr.src(
            "https://unpkg.com/prismjs@1.29.0/components/prism-autoloader.min.js",
          ),
        ],
        [],
      ),
    ]),
  ])
}

fn og_meta(property: String, content: String) -> Node {
  html.meta([
    attr.property(string.append("og:", property)),
    attr.content(content),
  ])
}

fn metadata() {
  html.Fragment([
    html.meta([
      attr.Attr("name", "viewport"),
      attr.Attr("content", "width=device-width, initial-scale=1"),
    ]),
    og_meta("title", "Nakai. ✨"),
    og_meta("description", "A library for building web apps with Gleam ✨"),
    og_meta("type", "website"),
    og_meta("url", "https://nakaixo.github.io"),
    og_meta(
      "image",
      "https://cdn.mckayla.cloud/-/f648cf5b6eee40b2982410757909716e/Nakai-Banner@2x.webp",
    ),
    og_meta(
      "image:secure_url",
      "https://cdn.mckayla.cloud/-/f648cf5b6eee40b2982410757909716e/Nakai-Banner@2x.webp",
    ),
    html.link([
      attr.rel("shortcut icon"),
      attr.href(
        "https://cdn.mckayla.cloud/-/f648cf5b6eee40b2982410757909716e/favicon.ico",
      ),
    ]),
    html.link([
      attr.rel("preconnect"),
      attr.href("https://fonts.googleapis.com"),
    ]),
    html.link([
      attr.rel("preconnect"),
      attr.href("https://fonts.gstatic.com"),
      attr.crossorigin(),
    ]),
    html.link([
      attr.rel("preconnect"),
      attr.href("https://cdn.mckayla.cloud"),
      attr.crossorigin(),
    ]),
    html.link([
      attr.rel("stylesheet"),
      attr.href(
        "https://fonts.googleapis.com/css2?family=Neuton&family=Nunito&display=swap",
      ),
    ]),
  ])
}
