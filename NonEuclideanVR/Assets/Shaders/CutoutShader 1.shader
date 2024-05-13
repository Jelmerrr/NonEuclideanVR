Shader"Unlit/new"
{
Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader
	{
		Tags{ "Queue" = "Transparent" "IgnoreProjector" = "True" "RenderType" = "Transparent" }
Lighting Off

Cull Back

ZWrite On

ZTest Less
		
		Fog{
Mode Off}

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
#include "UnityCG.cginc"

struct appdata
{
    float4 vertex : POSITION;
    float2 uv : TEXCOORD0;

            UNITY_VERTEX_INPUT_INSTANCE_ID
};

struct v2f
{
    float4 vertex : SV_POSITION;
    float4 screenPos : TEXCOORD1;

    UNITY_VERTEX_INPUT_INSTANCE_ID
            UNITY_VERTEX_OUTPUT_STEREO
         };

    v2f vert(appdata v)
    {
        v2f o;

        UNITY_SETUP_INSTANCE_ID(v);
        UNITY_INITIALIZE_OUTPUT(v2f, o);
        UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

        o.vertex = UnityObjectToClipPos(v.vertex);
        o.screenPos = ComputeScreenPos(o.vertex);

        return o;
    }

    fixed4 frag(v2f i) : SV_Target
    {
        UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
        i.screenPos /= i.screenPos.w;
        fixed4 col = i.screenPos.x, i.screenPos.y;
				
        return col;
    }
			ENDCG
		}
	}
}
