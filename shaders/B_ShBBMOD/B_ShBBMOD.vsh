// Comment out if you don't have tangent and bitangent sign in your vertex format.
#define USING_TBN

// Coumment out if you don't have bone indices and bone weights in your vertex format.
#define USING_SKINNING

#ifdef USING_TBN
#define in_TangentBitangentSign in_TextureCoord1
#endif

#ifdef USING_SKINNING
#define in_BoneIndex  in_TextureCoord2
#define in_BoneWeight in_TextureCoord3
#endif

attribute vec4 in_Position;             // (xyzw)
attribute vec3 in_Normal;               // (xyz)
attribute vec2 in_TextureCoord0;        // (uv)
attribute vec4 in_Colour;               // (rgba)
#ifdef USING_TBN
attribute vec4 in_TangentBitangentSign; // (tangent.xyz, bitangentSign)
#endif

#ifdef USING_SKINNING
attribute vec4 in_BoneIndex;
attribute vec4 in_BoneWeight;
#endif

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
#ifdef USING_TBN
varying mat3 v_mTBN;
#endif

void main()
{
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * in_Position;

	#ifdef USING_TBN
	vec3 N = (gm_Matrices[MATRIX_WORLD] * vec4(in_Normal, 0.0)).xyz; 
	vec3 T = (gm_Matrices[MATRIX_WORLD] * vec4(in_TangentBitangentSign.xyz, 0.0)).xyz;
	vec3 B = (gm_Matrices[MATRIX_WORLD] * vec4(
		cross(in_Normal, in_TangentBitangentSign.xyz) * in_TangentBitangentSign.w, 0.0)).xyz;
	v_mTBN = mat3(T, B, N);
	#endif

	v_vColour = in_Colour;
	v_vTexcoord = in_TextureCoord0;
}