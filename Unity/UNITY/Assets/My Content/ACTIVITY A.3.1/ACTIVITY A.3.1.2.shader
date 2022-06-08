Shader "Custom/A.3.1.2"
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

			float4 vert(float4 vertexPos : POSITION) : SV_POSITION
			{
			    float4 movement = float4(vertexPos.x, vertexPos.y + cos((_Time.y + vertexPos.z) * 3 / 2 ) , vertexPos.z, vertexPos.w);
			    return UnityObjectToClipPos(movement);
			}

			float4 frag(void) : COLOR
			{
                return _Color;
		    }
		    ENDCG
        }
	}
}