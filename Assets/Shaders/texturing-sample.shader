Shader "Custom/texturing-sample"
{
    Properties
    {
        _tex ("Texture", 2D) = "white" {}
        _albedo_range ("Albedo range", Range(0,1)) = 1
        _cube ("Cubemap", CUBE) = "" {}
        _emission_range ("Emission range", Range(0,1)) = 1
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _tex;
        fixed _albedo_range;
        samplerCUBE _cube;
        fixed _emission_range;

        struct Input
        {
            float2 uv_tex;
            float3 worldRefl;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_tex, IN.uv_tex).rgb * _albedo_range;
            o.Emission = texCUBE(_cube, IN.worldRefl).rgb * _emission_range;
        }
        
		ENDCG
    }
    
    Fallback "Diffuse"
}