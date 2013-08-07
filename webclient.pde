import processing.net.*;

Client c;
String data;

void setup() {
  size(200, 200);
  background(50);
  fill(200);
  c = new Client(this, "processing.org", 80)l
  c.write("GET / HTTP/1.0\n");
  c.write("Host: wemakesounds.com\n\n");
}

void draw() {
  if (c.available() > 0) {
    data += c.readString();
    println(data);
  }
}
