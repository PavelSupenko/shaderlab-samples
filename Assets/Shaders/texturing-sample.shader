Shader "Custom/texturing-sample"
{
    Properties
    {
        _tex ("Texture", 2D) = "white" {}
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _tex;

        struct Input
        {
            float2 uv_tex;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_tex, IN.uv_tex).rgb;
        }
        
		ENDCG
    }
    
    Fallback "Diffuse"
}