Shader "Custom/Shader-for-blue-bunny"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Emission ("Emission", Color) = (1,1,1,1)
        _Specular ("Specular", float) = 0.1
    }
    
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float2 uvMainTex;    
        };

        fixed4 _Color;
        fixed4 _Emission;
        half _Specular;

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color;
            o.Emission = _Emission;
            o.Specular = _Specular;
        }
        
        ENDCG
    }

    Fallback "Diffuse"
}