Shader "Custom/normal-mapping-with-reflections"
{
    Properties
    {
        _tex ("Diffuse Texture", 2D) = "white" {}
        _normal ("Bump Texture", 2D) = "bump" {}
        _bumpRange ("Bump Amount", Range(0,10)) = 1
        _cube ("CUBE Map", CUBE) = "white" {}
        _emissionRange ("Emission Amount", Range(0,10)) = 1
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _tex;
        sampler2D _normal;
        half _bumpRange;
        samplerCUBE _cube;
        half _emissionRange;

        struct Input
        {
            float2 uv_tex;
            float2 uv_normal;
            float3 worldRefl; INTERNAL_DATA
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_tex, IN.uv_tex).rgb; // for using texture as Albedo
            //o.Albedo = texCUBE(_cube, WorldReflectionVector(IN, o.Normal)).rgb; // for using reflection of enviroment as Albedo
            o.Normal = UnpackNormal(tex2D(_normal, IN.uv_normal)) * float3(_bumpRange,_bumpRange,1);
            o.Emission = texCUBE(_cube, WorldReflectionVector(IN, o.Normal)).rgb * _emissionRange;
        }
        
		ENDCG
    }
    
    Fallback "Diffuse"
}