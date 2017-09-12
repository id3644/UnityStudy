// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-1792-RGB,alpha-1353-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:4008,x:31535,y:33008,varname:node_4008,prsc:2;n:type:ShaderForge.SFN_ComponentMask,id:137,x:31759,y:33008,varname:node_137,prsc:2,cc1:0,cc2:2,cc3:-1,cc4:-1|IN-4008-XYZ;n:type:ShaderForge.SFN_Multiply,id:9380,x:32160,y:33078,varname:node_9380,prsc:2|A-5619-OUT,B-5826-OUT;n:type:ShaderForge.SFN_Slider,id:5986,x:31602,y:33213,ptovrint:False,ptlb:Tiling,ptin:_Tiling,varname:_Tiling,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.1,cur:0.9,max:1;n:type:ShaderForge.SFN_SwitchProperty,id:5619,x:31952,y:32942,ptovrint:False,ptlb:Worldspace tiling,ptin:_Worldspacetiling,varname:_Worldspacetiling,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-4477-OUT,B-137-OUT;n:type:ShaderForge.SFN_TexCoord,id:7300,x:31624,y:32774,varname:node_7300,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:4477,x:31785,y:32735,varname:node_4477,prsc:2|A-1161-OUT,B-7300-UVOUT;n:type:ShaderForge.SFN_Vector1,id:1161,x:31624,y:32696,varname:node_1161,prsc:2,v1:-20;n:type:ShaderForge.SFN_OneMinus,id:5826,x:31957,y:33157,varname:node_5826,prsc:2|IN-5986-OUT;n:type:ShaderForge.SFN_Vector1,id:1353,x:32490,y:32993,varname:node_1353,prsc:2,v1:1;n:type:ShaderForge.SFN_Tex2d,id:1792,x:32375,y:32642,ptovrint:False,ptlb:node_1792,ptin:_node_1792,varname:node_1792,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-9380-OUT;n:type:ShaderForge.SFN_TexCoord,id:1571,x:31985,y:32616,varname:node_1571,prsc:2,uv:0;proporder:5986-5619-1792;pass:END;sub:END;*/

Shader "Shader Forge/SWMM-test04" {
    Properties {
        _Tiling ("Tiling", Range(0.1, 1)) = 0.9
        [MaterialToggle] _Worldspacetiling ("Worldspace tiling", Float ) = 0
        _node_1792 ("node_1792", 2D) = "white" {}
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
            uniform fixed _Tiling;
            uniform fixed _Worldspacetiling;
            uniform sampler2D _node_1792; uniform float4 _node_1792_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float2 node_9380 = (lerp( ((-20.0)*i.uv0), i.posWorld.rgb.rb, _Worldspacetiling )*(1.0 - _Tiling));
                float4 _node_1792_var = tex2D(_node_1792,TRANSFORM_TEX(node_9380, _node_1792));
                float3 emissive = _node_1792_var.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
