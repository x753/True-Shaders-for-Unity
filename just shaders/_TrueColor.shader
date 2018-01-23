Shader "753/TrueColor"
{
    Properties
    {
        _Color ("Tint Color", Color) = (1,0,0,0)
        // adjust the tint color to change what color is displayed
    }
    
    SubShader
    {
        Tags { "Queue"="Overlay+7530" "IgnoreProjector"="True" "RenderType"="Overlay" "PreviewType"="Plane" }
        // queue is Overlay+7530 to ensure it is rendered no matter what is in the way of it

        Stencil // this is what allows true sight to work
        {
            Ref 753
            Comp NotEqual
        }

        ZTest Always // this is what makes the shader visible through anything

        Pass
        {
            ZWrite On
            ColorMask 0
        }
        
        Pass
        {
            Blend SrcAlpha SrcColor

            SetTexture [_MainTex] 
            {
                constantColor [_Color]
                combine texture * constant
            }
        }
    }
}