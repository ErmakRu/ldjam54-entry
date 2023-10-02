//
// Wave pixel shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;

void main()
{
	float t = v_vTexcoord.y;
	
	t = clamp(abs(t) - 1.0, 0.0, 1.0);
	
	float wave_offset = cos(time * 0.01 + v_vTexcoord.y * 300.0) * 0.001 * t;
	
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord + vec2(wave_offset, 0));
}
