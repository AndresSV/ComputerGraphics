Shader "Custom/A.3.1.1"
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
			    float4 movement = float4(vertexPos.x + (cos((_Time.y + vertexPos.z)/2) * 3), vertexPos.y, vertexPos.z, vertexPos.w);
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