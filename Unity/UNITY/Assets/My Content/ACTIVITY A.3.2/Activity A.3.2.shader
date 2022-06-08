Shader "Custom/Activity A.3.2"
{
        Properties {
        _AmbientMaterial("Ambient Color", Color) = (1, 1, 1, 1)
        _DiffuseMaterial("Diffuse Color", Color) = (1, 1, 1, 1)
        _SpecularMaterial("Specular Material", Color) = (1, 1, 1, 1)
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
            uniform float _FirstCut;
            uniform float _SecondCut;

            struct vertexInput {
                float4 position : POSITION;
                float3 normal : NORMAL;
            };

            struct vertexOutput {
                float4 position : SV_POSITION;
                float3 normal : NORMAL;
                float4 vertex : TEXCOORD1;
            };
            vertexOutput vert(vertexInput input) {
                vertexOutput result;
                result.position = UnityObjectToClipPos(input.position);
                result.normal = input.normal; 
                result.vertex = input.position;
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
                if(average <= 0.33)
                    return _AmbientMaterial * 0.4;
                if(average <= 0.66)
                    return _AmbientMaterial * 0.5;
                return _AmbientMaterial;
            }

            ENDCG
        }
    }
}