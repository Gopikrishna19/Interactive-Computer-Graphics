#version 130

uniform float uVertexScale;
uniform float uTime;
uniform sampler2D uTexUnit0, uTexUnit1;

in vec2 vTexCoord0, vTexCoord1;
in vec3 vColor;

out vec4 fragColor;

void main(void) {
  vec4 color = vec4(vColor.x, vColor.y, vColor.z, 1);
  vec4 texColor0 = texture(uTexUnit0, vTexCoord0);
  vec4 texColor1 = texture(uTexUnit1, vTexCoord1);

  // float lerper = clamp(.5 *uVertexScale, 0., 1.);
  // float lerper2 = clamp(.5 * uVertexScale + 1.0, 0.0, 1.0);

  // ======================================
  // TODO: use sin and uTime to interpolate
  //       between the two images
  // ======================================

  // _____________________________________
  //|									  |
  //|			CHANGED:				  |
  //|_____________________________________|
  //
  float sineVal = abs(sin(uTime / 1000));
  fragColor = sineVal * texColor0 + (1.0 - sineVal) * texColor1;

  // fragColor = ((lerper)*texColor1 + (1.0-lerper)*texColor0) * lerper2 + color * (1.0-lerper2);
}
