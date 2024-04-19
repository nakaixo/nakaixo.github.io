import nakai/attr
import nakai/html

const default_style = "
  color: #331f26;
  font-family: 'Neuton', serif;
  font-size: 128px;
  font-weight: 400;
"

pub fn default(text: String) {
  html.h1_text([attr.style(default_style)], text)
}
