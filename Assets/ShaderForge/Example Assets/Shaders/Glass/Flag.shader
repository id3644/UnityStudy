// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33382,y:32786,varname:node_3138,prsc:2|emission-6105-OUT;n:type:ShaderForge.SFN_Slider,id:6718,x:31374,y:32706,ptovrint:False,ptlb:Speed,ptin:_Speed,varname:node_6718,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Multiply,id:7054,x:31727,y:32712,varname:node_7054,prsc:2|A-6718-OUT,B-9861-TTR;n:type:ShaderForge.SFN_Time,id:9861,x:31460,y:32947,varname:node_9861,prsc:2;n:type:ShaderForge.SFN_Panner,id:1823,x:32026,y:32690,varname:node_1823,prsc:2,spu:0,spv:0.1|UVIN-8216-UVOUT,DIST-7054-OUT;n:type:ShaderForge.SFN_TexCoord,id:8216,x:32265,y:32459,varname:node_8216,prsc:2,uv:1;n:type:ShaderForge.SFN_Multiply,id:2123,x:32229,y:32880,varname:node_2123,prsc:2|A-1823-UVOUT,B-6478-OUT;n:type:ShaderForge.SFN_Slider,id:6478,x:31803,y:33057,ptovrint:False,ptlb:Scale,ptin:_Scale,varname:node_6478,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Tex2d,id:8713,x:32423,y:32803,ptovrint:False,ptlb:Muddle,ptin:_Muddle,varname:node_8713,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-2123-OUT;n:type:ShaderForge.SFN_Lerp,id:7568,x:32679,y:32716,varname:node_7568,prsc:2|A-8216-UVOUT,B-8713-R,T-5448-OUT;n:type:ShaderForge.SFN_Slider,id:5448,x:32226,y:33108,ptovrint:False,ptlb:Amount,ptin:_Amount,varname:node_5448,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0.118355,max:1;n:type:ShaderForge.SFN_Tex2d,id:763,x:32908,y:32808,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:node_763,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:aa762ee7680f35f4fb9a9210fa94ce61,ntxv:0,isnm:False|UVIN-7568-OUT;n:type:ShaderForge.SFN_Multiply,id:6105,x:33175,y:32989,varname:node_6105,prsc:2|A-763-RGB,B-9182-RGB,C-5046-RGB,D-6323-OUT;n:type:ShaderForge.SFN_VertexColor,id:9182,x:32875,y:33041,varname:node_9182,prsc:2;n:type:ShaderForge.SFN_Color,id:5046,x:32875,y:33262,ptovrint:False,ptlb:node_5046,ptin:_node_5046,varname:node_5046,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:6323,x:32845,y:33438,varname:node_6323,prsc:2,v1:2;proporder:763-8713-6718-6478-5448-5046;pass:END;sub:END;*/

Shader "Id3644/Fx/FakeFlag" {
    Properties {
        _Diffuse ("Diffuse", 2D) = "white" {}
        _Muddle ("Muddle", 2D) = "white" {}
        _Speed ("Speed", Range(0, 10)) = 1
        _Scale ("Scale", Range(0, 1)) = 0.5
        _Amount ("Amount", Range(-1, 1)) = 0.118355
        _node_5046 ("node_5046", Color) = (0.5,0.5,0.5,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 2.0
            uniform float4 _TimeEditor;
            uniform float _Speed;
            uniform float _Scale;
            uniform sampler2D _Muddle; uniform float4 _Muddle_ST;
            uniform float _Amount;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float4 _node_5046;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv1 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv1 = v.texcoord1;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos(v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 node_9861 = _Time + _TimeEditor;
                float2 node_2123 = ((i.uv1+(_Speed*node_9861.a)*float2(0,0.1))*_Scale);
                float4 _Muddle_var = tex2D(_Muddle,TRANSFORM_TEX(node_2123, _Muddle));
                float2 node_7568 = lerp(i.uv1,float2(_Muddle_var.r,_Muddle_var.r),_Amount);
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(node_7568, _Diffuse));
                float3 emissive = (_Diffuse_var.rgb*i.vertexColor.rgb*_node_5046.rgb*2.0);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
