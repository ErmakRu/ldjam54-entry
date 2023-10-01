//
// Wave pixel shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;

void main()
{
	float wave_offset = cos(time * 0.01 + v_vTexcoord.y * 100.0) * 0.002 * v_vTexcoord.y;
	
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord + vec2(wave_offset, 0));
}
