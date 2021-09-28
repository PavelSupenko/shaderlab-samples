Shader "Custom/world-reflection"
{
    Properties
    {
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _tex;
        sampler2D _normal;
        half _bumpRange;

        struct Input
        {
            float3 worldRefl;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = IN.worldRefl;
        }
        
		ENDCG
    }
    
    Fallback "Diffuse"
}