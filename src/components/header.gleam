import nakai/attr
import nakai/html

pub fn default(text: String) {
  html.h1_text([attr.class("header")], text)
}
