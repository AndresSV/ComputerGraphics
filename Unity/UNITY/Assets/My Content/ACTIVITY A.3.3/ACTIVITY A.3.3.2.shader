Shader "Custom/ACTIVITY A.3.3.2"
{
    Properties
    {
        _AmbientMaterial("Ambient Color", Color) = (1, 1, 1, 1)
        _DiffuseMaterial("Diffuse Color", Color) = (1, 1, 1, 1)
        _SpecularMaterial("Specular Material", Color) = (1, 1, 1, 1)
        _Shininess("Shininess", Float) = 100
        _FirstLevel("Level", Float) = 0.33
        _SecondLevel("Level", Float) = 0.66
        _Tex("The texture", 2D) = "white" {}
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
            uniform float _Shininess;
            uniform float4 _LightColor0;
            uniform float _FirstLevel;
            uniform float _SecondLevel;
            uniform sampler2D _Tex;

            struct vertexInput {
                float4 position : POSITION;
                float3 normal : NORMAL;
                float4 coord : TEXCOORD0;
            };

            struct vertexOutput {
                float4 position : SV_POSITION;
                float3 normal : NORMAL;
                float4 vertex : TEXCOORD1;
                float4 coord : TEXCOORD0;
            };

            vertexOutput vert(vertexInput vertex) {
                vertexOutput result;
                result.position = UnityObjectToClipPos(vertex.position);
                result.normal = vertex.normal; 
                result.vertex = vertex.position;
                result.coord = vertex.coord;
                return result;
            }

            float4 frag(vertexOutput input) : COLOR {
                float i = _LightColor0;
                float4 ambient = _AmbientMaterial * i * 0.25;
                float3 n = UnityObjectToWorldNormal(input.normal);
                float3 lm = normalize(_WorldSpaceLightPos0.xyz);
                float4 diffuse = _DiffuseMaterial * i * max(0.0, dot(lm, n));
                float4 ks = _SpecularMaterial;
                float3 r = reflect(-lm, n);
                float3 camera = _WorldSpaceCameraPos;
                float4 specular = float4(0, 0, 0, 0);
                float4 result = ambient + diffuse + specular;
                float average = (result.r + result.g + result.b) / 3;
                float4 textureColor = tex2D(_Tex, input.coord.xy);
                if(average <= _FirstLevel)
                    return _AmbientMaterial * textureColor * 0.4;
                if(average <= _SecondLevel)
                    return _AmbientMaterial * textureColor * 0.5;
                return _AmbientMaterial * textureColor;
            }
            ENDCG
        }
    }
}