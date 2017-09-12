// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-9774-OUT,alpha-2607-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32047,y:32711,ptovrint:False,ptlb:C,ptin:_C,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:1,c4:1;n:type:ShaderForge.SFN_Slider,id:2492,x:31479,y:33022,ptovrint:False,ptlb:Rim falloff,ptin:_Rimfalloff,varname:_Rimfalloff,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-5,cur:0.25,max:5;n:type:ShaderForge.SFN_Slider,id:4031,x:31479,y:32819,ptovrint:False,ptlb:Rim Size,ptin:_RimSize,varname:_RimSize,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-4,cur:2,max:4;n:type:ShaderForge.SFN_DepthBlend,id:1214,x:31857,y:32821,varname:node_1214,prsc:2|DIST-4031-OUT;n:type:ShaderForge.SFN_Power,id:7530,x:32090,y:32941,varname:node_7530,prsc:2|VAL-1214-OUT,EXP-2492-OUT;n:type:ShaderForge.SFN_OneMinus,id:5073,x:32282,y:32959,cmnt:Intersection mask,varname:node_5073,prsc:0|IN-7530-OUT;n:type:ShaderForge.SFN_Lerp,id:9774,x:32499,y:32790,varname:node_9774,prsc:2|A-254-OUT,B-7241-RGB,T-5073-OUT;n:type:ShaderForge.SFN_Vector1,id:2607,x:32560,y:33010,varname:node_2607,prsc:2,v1:1;n:type:ShaderForge.SFN_Color,id:8926,x:31460,y:31665,ptovrint:False,ptlb:A,ptin:_A,varname:_Color_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_DepthBlend,id:266,x:31557,y:32169,varname:node_266,prsc:2|DIST-5376-OUT;n:type:ShaderForge.SFN_Slider,id:5376,x:31225,y:32273,ptovrint:False,ptlb:node_9838,ptin:_node_9838,varname:node_9838,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:30;n:type:ShaderForge.SFN_Lerp,id:254,x:31967,y:32098,varname:node_254,prsc:2|A-8926-RGB,B-1006-RGB,T-266-OUT;n:type:ShaderForge.SFN_Color,id:1006,x:31460,y:31862,ptovrint:False,ptlb:B,ptin:_B,varname:node_2720,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0,c4:1;proporder:8926-1006-5376-7241-2492-4031;pass:END;sub:END;*/

Shader "Shader Forge/SWMM-test02" {
    Properties {
        _A ("A", Color) = (1,0,0,1)
        _B ("B", Color) = (0,1,0,1)
        _node_9838 ("node_9838", Range(0, 30)) = 0
        _C ("C", Color) = (0,0,1,1)
        _Rimfalloff ("Rim falloff", Range(-5, 5)) = 0.25
        _RimSize ("Rim Size", Range(-4, 4)) = 2
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _CameraDepthTexture;
            uniform float4 _C;
            uniform fixed _Rimfalloff;
            uniform fixed _RimSize;
            uniform float4 _A;
            uniform float _node_9838;
            uniform float4 _B;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 projPos : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos(v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
////// Lighting:
////// Emissive:
                float3 emissive = lerp(lerp(_A.rgb,_B.rgb,saturate((sceneZ-partZ)/_node_9838)),_C.rgb,(1.0 - pow(saturate((sceneZ-partZ)/_RimSize),_Rimfalloff)));
                float3 finalColor = emissive;
                return fixed4(finalColor,1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
