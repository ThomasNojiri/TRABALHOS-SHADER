Shader "Custom/SHADER2"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}

    }
        SubShader
    {
        Tags { "RenderType" = "Opaque" }
        LOD 100

        Pass
        {
            HLSLPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #include  "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

                struct Attributes
                {
                    float4 position :POSITION;
                    float2 uv       :TEXCOORD0;
                };

                struct Varyings
                {
                    float4 positionVAR :SV_POSITION;
                    float2 uvVAR       : TEXCOORD0;
                };

                Varyings vert(Attributes Input)
                {
                    Varyings Output;

                    Output.positionVAR = TransformObjectToHClip(Input.position.xyz);
                    Output.uvVAR = Input.uv;

                    //Output.positionVAR = Input.position;

                    return Output;
                }
                float4 frag(Varyings Input) :SV_TARGET
                {
                    float4 color = float4(0,1,0,1);
                    if (Input.uvVAR.x < 0.8) {
                         color = float4(0.09,0.6,0.05,1);
                    }
                    if (Input.uvVAR.x > 0.33 )
                    {
                        color = float4(1, 1, 1, 1);
                    }
                    if (Input.uvVAR.x > 0.33 && Input.uvVAR.x > 0.7)
                    {
                        color = float4(0.7, 0.05, 0.05, 1);
                    }

                    return color;
                }



            ENDHLSL
        }
    }
}
