Shader "Custom/A.3.1.3"
{
	Properties
    {
		_Color("Color", Color) = (1, 1, 1, 1)
	}
    
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
			#pragma fragment frag
            
            uniform float4 _Color;

			struct vertexInput
			{
                float4 position : POSITION;
                float3 normal : NORMAL;
            };

			float4 vert(vertexInput vertex) : SV_POSITION
			{
			    float4 heartbeat = vertex.position + float4(vertex.normal  * cos(_Time.y), 0);
                return UnityObjectToClipPos(heartbeat);
			}

			float4 frag(void) : COLOR
			{
                return _Color;
		    }
		    ENDCG
        }
	}
}