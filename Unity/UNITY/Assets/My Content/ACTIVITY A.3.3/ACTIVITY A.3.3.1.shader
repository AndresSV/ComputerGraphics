Shader "Custom/ACTIVITY A.3.3.1"
{
    Properties
    {
        _AmbientMaterial("Ambient Color", Color) = (1, 1, 1, 1)
        _DiffuseMaterial("Diffuse Color", Color) = (1, 1, 1, 1)
        _SpecularMaterial("Specular Material", Color) = (1, 1, 1, 1)
        _Shininess("Shininess", Float) = 100
        _Tex("Texture", 2D) = "white" {}
        _NormalMap("Normal map", 2D) = "white" {}
    }

    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            uniform float4 _AmbientMaterial;
            uniform float4 _DiffuseMaterial;
            uniform float4 _SpecularMaterial;
            uniform float4 _LightColor0;
            uniform float _Shininess;
            uniform sampler2D _Tex;
            uniform sampler2D _NormalMap;

            struct vertexInput 
            {
                float4 position : POSITION;
                float3 normal : NORMAL;
                float4 coord : TEXCOORD0;
            };

            struct vertexOutput 
            {
                float4 position : SV_POSITION;
                float3 normal : NORMAL;
                float4 vertex : TEXCOORD1;
                float4 coord : TEXCOORD0;
            };

            vertexOutput vert(vertexInput vertex)
            {
                vertexOutput result;
                result.position = UnityObjectToClipPos(vertex.position);
                result.normal = vertex.normal; 
                result.vertex = vertex.position;
                result.coord = vertex.coord;
                return result;
            }

            float4 frag(vertexOutput input) : COLOR 
            {
                float3 mappedNormal = tex2D(_NormalMap, input.coord.xy).xyz;
                float i = _LightColor0;
                float4 ambient = _AmbientMaterial * i * 0.25;
                float3 n = UnityObjectToWorldNormal(input.normal);
                float3 lm = normalize(_WorldSpaceLightPos0.xyz);
                float4 diffuse = _DiffuseMaterial * i * max(0.0, dot(lm, n));
                float4 ks = _SpecularMaterial;
                float a = _Shininess;
                float3 r = reflect(-lm, n);
                float3 vertexGlobal = mul(unity_ObjectToWorld, input.vertex).xyz;
                float3 camera = _WorldSpaceCameraPos;
                float3 v = normalize(camera - vertexGlobal);
                float4 specular = ks * i * pow(max(0.0, dot(r, v)), a);
                float4 phong = ambient + diffuse + specular; 
                float4 tex = tex2D(_Tex, input.coord.xy);
                return phong * tex;   
            }

            ENDCG
        }
    }
}