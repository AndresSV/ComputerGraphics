Shader "Custom/ACTIVITY A.3.3.3"
{
    Properties {
        _AmbientMaterial("Ambient Color", Color) = (1, 1, 1, 1)
        _DiffuseMaterial("Diffuse Color", Color) = (1, 1, 1, 1)
        _SpecularMaterial("Specular Material", Color) = (1, 1, 1, 1)
        _Detail("Detail Value", float) = 0.235
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
            uniform float4 _LightColor0;
            uniform float _Detail;
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
                float4 result = (ambient + diffuse + specular) * tex2D(_Tex, input.coord.xy);
                float average = (result.r + result.g + result.b) / 3;
                if(average < _Detail){
                    return float4(0, 0, 0, 1);
                }
                return float4(1, 1, 1, 1);     
            }

            ENDCG
        }
    }
}