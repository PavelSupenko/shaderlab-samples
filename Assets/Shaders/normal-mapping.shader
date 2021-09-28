Shader "Custom/normal-mapping"
{
    Properties
    {
        _tex ("Texture", 2D) = "white" {}
        _normal ("Normal", 2D) = "bump" {}
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _tex;
        sampler2D _normal;

        struct Input
        {
            float2 uv_tex;
            float2 uv_normal;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_tex, IN.uv_tex).rgb;
            o.Normal = UnpackNormal(tex2D(_normal, IN.uv_normal));
        }
        
		ENDCG
    }
    
    Fallback "Diffuse"
}