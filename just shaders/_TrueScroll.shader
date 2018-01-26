Shader "753/trueScroll"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
        _ScrollSpeedX("Scroll Speed X", Range(0,10)) = 5
        _ScrollSpeedY("Scroll Speed Y", Range(0,10)) = 5
    }
    
    SubShader
    {
        Tags { "Queue"="Transparent" "RenderType"="Transparent" }
        Blend SrcAlpha One

        CGPROGRAM
        #pragma surface surf Lambert alpha:fade

        struct Input
        {
            float2 uv_MainTex;
        };
    
        sampler2D _MainTex;
        fixed _ScrollSpeedX;
        fixed _ScrollSpeedY;

        void surf(Input IN, inout SurfaceOutput o)
        {
            fixed scrollX = _Time * _ScrollSpeedX;
            fixed scrollY = _Time * _ScrollSpeedY;

            fixed2 scrolledUV = IN.uv_MainTex;
            scrolledUV = scrolledUV + fixed2(scrollX, scrollY);
            half4 tex = tex2D(_MainTex, scrolledUV);
            o.Albedo = o.Albedo + tex.rgb;
            o.Alpha = tex.a;
        }
        ENDCG
    }

    Fallback "Diffuse"
 }