// Color represents the colour set by love.graphics.setColor()
// Texture represents the image being drawn
// texture_coords represent the normalised coordinates of the of the current pixel relative to the image
// screen_coords represent the normalised coordinates of the of the current pixel relative to the screen

extern number screen_width;
vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords){
    vec4 pixel = Texel(texture, texture_coords); // This is the current pixel colour
    number average = (pixel.r + pixel.g + pixel.b) / 3.0;
    number factor = screen_coords.x / screen_width;
    pixel.r = pixel.r + (average - pixel.r) * factor;
    pixel.g = pixel.g + (average - pixel.g) * factor;
    pixel.b = pixel.b + (average - pixel.b) * factor;
    return pixel;
}