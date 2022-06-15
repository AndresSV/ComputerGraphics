Shader "Custom/ExamShader"
{
    Properties
    {
        _MainTex ("Base (RGB)", 2D) = "white" {}
    }
    
    SubShader
    {

        Stencil 
        {
            Ref 1
            Comp Always
            Pass Replace
        }

        Pass 
        {

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            uniform float4 _LightColor0;

            uniform sampler2D _MainTex;

            struct vertexInput
            {
                float4 position :   POSITION;
                float3 normal   :   NORMAL;
                float4 coord    :   TEXCOORD0;
            };

            struct vertexOutput
            {
                float4 position :   SV_POSITION;
                float3 normal   :   NORMAL;
                float4 vertex   :   TEXCOORD1;
                float4 coord    :   TEXCOORD0;
            };

            vertexOutput vert (vertexInput vertex)
            {
                vertexOutput output;
                output.position =   UnityObjectToClipPos(vertex.position);
                output.normal   =   vertex.normal; 
                output.vertex   =   vertex.position;
                output.coord    =   vertex.coord;
                return output;
            }

            float4 frag (vertexOutput vertex) : COLOR
            {
                // float3 normalColor = vertex.normal * 0.5 + 0.5;
                // float4 textureColor = tex2D(_MainTex, vertex.coord.xy);
                // float4 diffuse = max(0.0, dot(textureColor, normalColor));
                // return diffuse * float4(normalColor,1);

                float3 normalColor = vertex.normal / 0.5; 
                float4 textureColor = tex2D(_MainTex, vertex.coord.xy);
                float average = (textureColor.r + textureColor.g + textureColor.b ) / 3;
                float4 result = float4(normalColor, 1) * average;
                return result;
            }
            ENDCG
        }
        
        Pass
        {
            Cull Off
            Stencil 
            {
                Ref 1
                Comp NotEqual
                Pass Keep
            }
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            #include "UnityCG.cginc"

            float _Outline;
            float _WaveAmplitude;
            float _WavePeriod;
            float _WaveVerticalShift;

            float4 vert(float4 vertex : POSITION, float3 normal : NORMAL) : SV_POSITION
            {
                return UnityObjectToClipPos( vertex + normal * 0.04 * ( sin( ( _Time.y ) + ( vertex.x * 2 ) ) + 0.5 ) );

            }

            float4 frag() : COLOR
            {
                return float4(0, 0, 0, 1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
