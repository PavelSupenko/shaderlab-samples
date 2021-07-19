Shader "Custom/texturing-sample"
{
    Properties
    {
        _myTex ("Texture 2D", 2D) = "white" {}
        _myRange ("Range", Range(0,5)) = 1
    }
    SubShader
    {
        CGPROGRAM
        
        #pragma surface surf Lambert

        sampler2D _myTex;
        half _myRange;

        struct Input
        {
            float2 uv_myTex;
            float3 worldRefl;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = (tex2D(_myTex, IN.uv_myTex) * _myRange).rgb;
        }
        
        ENDCG
    }
    FallBack "Diffuse"
}
