Shader "Custom/normal-mapping"
{
    Properties
    {
        _tex ("Diffuse Texture", 2D) = "white" {}
        _normal ("Bump Texture", 2D) = "bump" {}
        _bumpRange ("Bump Amount", Range(0,10)) = 1
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
            float2 uv_tex;
            float2 uv_normal;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_tex, IN.uv_tex).rgb;
            o.Normal = UnpackNormal(tex2D(_normal, IN.uv_normal)) * float3(_bumpRange,_bumpRange,1);
        }
        
		ENDCG
    }
    
    Fallback "Diffuse"
}