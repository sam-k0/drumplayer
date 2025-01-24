//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;

float width = 1920.0;
float height = 1080.0;

vec3 col_prescale = vec3(.1,.1,.1);

void main()
{
	
	vec2 pixel = gl_FragCoord.xy;
	vec2 uv = pixel / vec2(width,height);
	float rainbow = mod(uv.y + time * 0.1, 1.0);
	
    vec3 color;
    color.r = col_prescale.r + 0.3 * sin(rainbow * 6.28318);           // Red channel
    color.g = col_prescale.g + 0.3 * sin(rainbow * 6.28318 + 2.09439); // Green channel (offset by 120°)
    color.b = col_prescale.b + 0.3 * sin(rainbow * 6.28318 + 4.18879); // Blue channel (offset by 240°)


    gl_FragColor = vec4(color,1.0) + v_vColour* texture2D( gm_BaseTexture, v_vTexcoord );
}
