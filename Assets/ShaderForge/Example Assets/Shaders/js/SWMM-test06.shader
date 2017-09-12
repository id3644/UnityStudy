// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-4766-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2256,x:30365,y:33328,ptovrint:False,ptlb:Surface Hightlight tiling,ptin:_SurfaceHightlighttiling,varname:_SurfaceHightlighttiling,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.25;n:type:ShaderForge.SFN_Multiply,id:5432,x:30748,y:33149,varname:node_5432,prsc:0|A-6841-UVOUT,B-2256-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:6255,x:30437,y:33541,ptovrint:False,ptlb:Shadermap,ptin:_Shadermap,varname:_Shadermap,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:True,tagnrm:False,tex:4711f28d002f22540aae723ef0c6d0d7,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8217,x:30978,y:33234,varname:node_5469,prsc:2,tex:4711f28d002f22540aae723ef0c6d0d7,ntxv:0,isnm:False|UVIN-5432-OUT,TEX-6255-TEX;n:type:ShaderForge.SFN_Subtract,id:750,x:31470,y:33446,varname:node_750,prsc:2|A-8217-R,B-8217-G;n:type:ShaderForge.SFN_Slider,id:9629,x:31313,y:33347,ptovrint:False,ptlb:Surface hightlight size,ptin:_Surfacehightlightsize,varname:_Surfacehightlightsize,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Vector1,id:851,x:31452,y:33256,varname:node_851,prsc:2,v1:0;n:type:ShaderForge.SFN_Smoothstep,id:1714,x:31693,y:33325,varname:node_1714,prsc:2|A-851-OUT,B-9629-OUT,V-750-OUT;n:type:ShaderForge.SFN_Power,id:9538,x:31911,y:33384,varname:node_9538,prsc:2|VAL-1714-OUT,EXP-8388-OUT;n:type:ShaderForge.SFN_Vector1,id:8388,x:31693,y:33480,varname:node_8388,prsc:2,v1:10;n:type:ShaderForge.SFN_Slider,id:4302,x:31754,y:33606,ptovrint:False,ptlb:Surface Highlight,ptin:_SurfaceHighlight,varname:_SurfaceHighlight,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.05,max:1;n:type:ShaderForge.SFN_Multiply,id:7604,x:32145,y:33467,varname:node_7604,prsc:2|A-9538-OUT,B-4302-OUT;n:type:ShaderForge.SFN_Clamp01,id:4766,x:32329,y:33400,varname:node_4766,prsc:0|IN-7604-OUT;n:type:ShaderForge.SFN_Vector1,id:8787,x:30416,y:32996,varname:node_8787,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:4347,x:31006,y:33765,varname:node_4347,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Panner,id:6841,x:30401,y:33133,varname:node_6841,prsc:2,spu:0,spv:0|UVIN-1911-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1911,x:30123,y:33093,varname:node_1911,prsc:2,uv:0;proporder:2256-6255-9629-4302;pass:END;sub:END;*/

Shader "Shader Forge/SWMM-test06" {
    Properties {
        _SurfaceHightlighttiling ("Surface Hightlight tiling", Float ) = 0.25
        [NoScaleOffset]_Shadermap ("Shadermap", 2D) = "black" {}
        _Surfacehightlightsize ("Surface hightlight size", Range(0, 1)) = 0
        _SurfaceHighlight ("Surface Highlight", Range(0, 1)) = 0.05
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
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform fixed _SurfaceHightlighttiling;
            uniform sampler2D _Shadermap;
            uniform fixed _Surfacehightlightsize;
            uniform fixed _SurfaceHighlight;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 node_2625 = _Time + _TimeEditor;
                fixed2 node_5432 = ((i.uv0+node_2625.g*float2(0,0))*_SurfaceHightlighttiling);
                float4 node_5469 = tex2D(_Shadermap,node_5432);
                fixed node_4766 = saturate((pow(smoothstep( 0.0, _Surfacehightlightsize, (node_5469.r-node_5469.g) ),10.0)*_SurfaceHighlight));
                float3 emissive = float3(node_4766,node_4766,node_4766);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
