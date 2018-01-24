Shader "753/TrueImage"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }

    SubShader
    {
        Tags { "Queue"="Overlay+7530" "IgnoreProjector"="True" "RenderType"="Overlay" "PreviewType"="Plane" }
        // queue is Overlay+7530 to ensure it is rendered no matter what is in the way of it
        
        ZTest Always // this is what makes the shader visible through anything

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
 
            sampler2D _MainTex;

            float4 vert (appdata_base v) : SV_POSITION
            {
                return UnityObjectToClipPos(v.vertex);
            }
 
            fixed4 frag (float4 i : VPOS) : SV_Target
            {
                return tex2D(_MainTex, float2(i.xy / _ScreenParams.xy));
            }
            ENDCG
        }
    }
}