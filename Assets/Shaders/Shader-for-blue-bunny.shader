Shader "Custom/Shader-for-blue-bunny"
{
    Properties
    {
        _colour ("Colour", Color) = (1,1,1,1)
        _emission ("Emission", Color) = (0,0,0,1)
        _normal ("Normal", Color) = (1,1,1,1)
    }
    
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float2 uvMainTex;
        };

        fixed4 _colour;
        fixed4 _emission;
        fixed4 _normal;

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _colour.rgb;
            o.Emission = _emission;
            o.Normal = _normal;
        }

        ENDCG
            
    }
    
    FallBack "Diffuse"
}
