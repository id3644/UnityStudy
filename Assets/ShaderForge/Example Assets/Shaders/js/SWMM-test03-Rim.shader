// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-7826-OUT;n:type:ShaderForge.SFN_NormalVector,id:8223,x:31319,y:32935,prsc:2,pt:False;n:type:ShaderForge.SFN_Fresnel,id:3058,x:31527,y:32935,varname:node_3058,prsc:2|NRM-8223-OUT;n:type:ShaderForge.SFN_Power,id:7826,x:31830,y:32945,varname:node_7826,prsc:2|VAL-3058-OUT,EXP-4267-OUT;n:type:ShaderForge.SFN_OneMinus,id:7641,x:32241,y:32955,varname:node_7641,prsc:0|IN-6736-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4267,x:31593,y:33092,ptovrint:False,ptlb:Fresnel exponent,ptin:_Fresnelexponent,varname:_Fresnelexponent,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:4;n:type:ShaderForge.SFN_Color,id:2054,x:31852,y:33163,ptovrint:False,ptlb:Fresnel Color,ptin:_FresnelColor,varname:_FresnelColor,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:0.5019608;n:type:ShaderForge.SFN_Multiply,id:6736,x:32047,y:32955,varname:node_6736,prsc:2|A-7826-OUT,B-2054-A;proporder:4267-2054;pass:END;sub:END;*/

Shader "Shader Forge/SWMM-test03" {
    Properties {
        _Fresnelexponent ("Fresnel exponent", Float ) = 4
        _FresnelColor ("Fresnel Color", Color) = (1,1,1,0.5019608)
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
            uniform fixed _Fresnelexponent;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float node_7826 = pow((1.0-max(0,dot(i.normalDir, viewDirection))),_Fresnelexponent);
                float3 emissive = float3(node_7826,node_7826,node_7826);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
