Shader "Custom/packed-matrices-arrays"
{
    Properties
    {
        _myColor ("Albedo & Alpha Color", Color) = (1,1,1,1)
    }
    
    SubShader
    {
        CGPROGRAM
        
        #pragma surface surf Lambert

        struct Input
        {
            float2 uvMainTex;
        };

        fixed4 _myColor;

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo.r = _myColor.r;
            o.Alpha = _myColor.a;
        }
        
        ENDCG
    }
    
    FallBack "Diffuse"
}
