//
//#ifndef Gobal_h
//#define Gobal_h
//
//#include <defs.h>
//#include <arm_neon.h>
//
//static struct Vector3{
//    float x;
//    float y;
//    float z;
//}*LPVector3;
//
//static struct Vector4{
//    float x;
//    float y;
//    float z;
//    float l;
//    float sx;
//    float sy;
//}*LPVector4;
//
////Vector3
//class CVector3
//{
//public:
//    CVector3() : x(0.f), y(0.f), z(0.f)
//    {
//
//    }
//
//    CVector3(float _x, float _y, float _z) : x(_x), y(_y), z(_z)
//    {
//
//    }
//    ~CVector3()
//    {
//
//    }
//
//    float x;
//    float y;
//    float z;
//
//    CVector3 operator+(CVector3 v)
//    {
//        return CVector3(x + v.x, y + v.y, z + v.z);
//    }
//
//    CVector3 operator-(CVector3 v)
//    {
//        return CVector3(x - v.x, y - v.y, z - v.z);
//    }
//};
//
//
//static struct LTMatrix{
//    float a1;
//    float a2;
//    float a3;
//    float a4;
//    float b1;
//    float b2;
//    float b3;
//    float b4;
//    float c1;
//    float c2;
//    float c3;
//    float c4;
//    float d1;
//    float d2;
//    float d3;
//    float d4;
//}*LPMatrix;
//
//struct FQuat
//{
//    float x;
//    float y;
//    float z;
//    float w;
//};
//
//struct FTransform
//{
//    FQuat rot;
//    CVector3 translation;
//    CVector3 scale;
//    LTMatrix ToMatrixWithScale()
//    {
//        LTMatrix m;
//        m.d1 = translation.x;
//        m.d2 = translation.y;
//        m.d3 = translation.z;
//
//        float x2 = rot.x + rot.x;
//        float y2 = rot.y + rot.y;
//        float z2 = rot.z + rot.z;
//
//        float xx2 = rot.x * x2;
//        float yy2 = rot.y * y2;
//        float zz2 = rot.z * z2;
//        m.a1 = (1.0f - (yy2 + zz2)) * scale.x;
//        m.b2 = (1.0f - (xx2 + zz2)) * scale.y;
//        m.c3 = (1.0f - (xx2 + yy2)) * scale.z;
//
//        float yz2 = rot.y * z2;
//        float wx2 = rot.w * x2;
//        m.c2 = (yz2 - wx2) * scale.z;
//        m.b3 = (yz2 + wx2) * scale.y;
//
//        float xy2 = rot.x * y2;
//        float wz2 = rot.w * z2;
//        m.b1 = (xy2 - wz2) * scale.y;
//        m.a2 = (xy2 + wz2) * scale.x;
//
//        float xz2 = rot.x * z2;
//        float wy2 = rot.w * y2;
//        m.c1 = (xz2 + wy2) * scale.z;
//        m.a3 = (xz2 - wy2) * scale.x;
//
//        m.a4 = 0.0f;
//        m.b4 = 0.0f;
//        m.c4 = 0.0f;
//        m.d4 = 1.0f;
//
//        return m;
//    }
//};
//
//enum Bones : int
//{
//    Pelvis = 1,             //骨盆
//    Spine = 4,              //脊柱 胸部
//    Head = 6,               //头部
//    Left_Shoulder = 12,     //左肩膀
//    Left_Elbow = 13,        //左手肘
//    Left_Hand = 14,         //左手
//    Right_Shoulder = 33,    //右肩膀
//    Right_Elbow = 34,       //右手肘
//    Right_Hand = 35,        //右手
//    Left_Pelvis = 53,       //左屁股
//    Left_Knee = 54,         //左膝盖
//    Left_Foot = 55,         //左脚
//    Right_Pelvis = 57,      //右屁股
//    Right_Knee = 58,        //右膝盖
//    Right_Foot = 59         //右脚
//};
//
//
//#endif
//
//
//LTMatrix MatrixMultiplication(LTMatrix pM1, LTMatrix pM2);//MatrixMultiplication
//LTMatrix MatrixMultiplication(LTMatrix pM1, LTMatrix pM2)
//{
//    LTMatrix pOut;
//    pOut.a1 = pM1.a1 * pM2.a1 + pM1.a2 * pM2.b1 + pM1.a3 * pM2.c1 + pM1.a4 * pM2.d1;
//    pOut.a2 = pM1.a1 * pM2.a2 + pM1.a2 * pM2.b2 + pM1.a3 * pM2.c2 + pM1.a4 * pM2.d2;
//    pOut.a3 = pM1.a1 * pM2.a3 + pM1.a2 * pM2.b3 + pM1.a3 * pM2.c3 + pM1.a4 * pM2.d3;
//    pOut.a4 = pM1.a1 * pM2.a4 + pM1.a2 * pM2.b4 + pM1.a3 * pM2.c4 + pM1.a4 * pM2.d4;
//    pOut.b1 = pM1.b1 * pM2.a1 + pM1.b2 * pM2.b1 + pM1.b3 * pM2.c1 + pM1.b4 * pM2.d1;
//    pOut.b2 = pM1.b1 * pM2.a2 + pM1.b2 * pM2.b2 + pM1.b3 * pM2.c2 + pM1.b4 * pM2.d2;
//    pOut.b3 = pM1.b1 * pM2.a3 + pM1.b2 * pM2.b3 + pM1.b3 * pM2.c3 + pM1.b4 * pM2.d3;
//    pOut.b4 = pM1.b1 * pM2.a4 + pM1.b2 * pM2.b4 + pM1.b3 * pM2.c4 + pM1.b4 * pM2.d4;
//    pOut.c1 = pM1.c1 * pM2.a1 + pM1.c2 * pM2.b1 + pM1.c3 * pM2.c1 + pM1.c4 * pM2.d1;
//    pOut.c2 = pM1.c1 * pM2.a2 + pM1.c2 * pM2.b2 + pM1.c3 * pM2.c2 + pM1.c4 * pM2.d2;
//    pOut.c3 = pM1.c1 * pM2.a3 + pM1.c2 * pM2.b3 + pM1.c3 * pM2.c3 + pM1.c4 * pM2.d3;
//    pOut.c4 = pM1.c1 * pM2.a4 + pM1.c2 * pM2.b4 + pM1.c3 * pM2.c4 + pM1.c4 * pM2.d4;
//    pOut.d1 = pM1.d1 * pM2.a1 + pM1.d2 * pM2.b1 + pM1.d3 * pM2.c1 + pM1.d4 * pM2.d1;
//    pOut.d2 = pM1.d1 * pM2.a2 + pM1.d2 * pM2.b2 + pM1.d3 * pM2.c2 + pM1.d4 * pM2.d2;
//    pOut.d3 = pM1.d1 * pM2.a3 + pM1.d2 * pM2.b3 + pM1.d3 * pM2.c3 + pM1.d4 * pM2.d3;
//    pOut.d4 = pM1.d1 * pM2.a4 + pM1.d2 * pM2.b4 + pM1.d3 * pM2.c4 + pM1.d4 * pM2.d4;
//
//    return pOut;
//}
//
//FTransform GetBoneIndex(const long mesh, int index);//GetBoneIndex
//FTransform GetBoneIndex(const long mesh, int index){
//    long v30 = *(long *)(mesh + 1736);
//    long boneBase = (v30 + 48LL * index);
//
//    FTransform result;
//    if(boneBase>0x100000000){
//
//        result.rot.x = *(float*)(boneBase + 0x0);
//        result.rot.y = *(float*)(boneBase + 0x4);
//        result.rot.z = *(float*)(boneBase + 0x8);
//        result.rot.w = *(float*)(boneBase + 0xC);
//        CVector3 pos;
//
//        pos.x = *(float*)(boneBase + 0x10);
//        pos.y = *(float*)(boneBase + 0x14);
//        pos.z = *(float*)(boneBase + 0x18);
//
//
//        if (index == 6)
//        {
//            if (pos.x <= -25.0f)
//            {
//                result.translation.x = pos.x + (pos.x / 2);
//            }
//            else if (pos.x >= 25.0f)
//            {
//                result.translation.x = pos.x + (pos.x / 3.5);
//            }
//            else
//            {
//                result.translation.x = pos.x + (pos.x / 2);
//            }
//
//            result.translation.y = pos.y + 12.0f;
//            result.translation.z = pos.z + 10.0f;
//        }
//        else if (index == 4)
//        {
//            result.translation.x = pos.x;
//            result.translation.y = pos.y;
//            result.translation.z = pos.z + 10.0f;;
//        }
//        else
//        {
//            result.translation.x = pos.x;
//            result.translation.y = pos.y;
//            result.translation.z = pos.z;
//        }
//
//        if (index == 4)
//        {
//            result.translation.z += 10;
//        }
//
//        result.scale.x = *(float*)(boneBase + 0x20);
//        result.scale.y = *(float*)(boneBase + 0x24);
//        result.scale.z = *(float*)(boneBase + 0x2C);
//    }
//
//
//    return result;
//}
//
//CVector3 GetBoneWithRotation(const long mesh, int id)//GetBoneWithRotation
//{
//    CVector3 result;
//
//    FTransform bone = GetBoneIndex(mesh, id);
//
//    FTransform ComponentToWorld;
//    ComponentToWorld.rot.x = *(float*)(mesh + 0x1b0);
//    ComponentToWorld.rot.y = *(float*)(mesh + 0x1b4);
//    ComponentToWorld.rot.z = *(float*)(mesh + 0x1b8);
//    ComponentToWorld.rot.w = *(float*)(mesh + 0x1bc);
//
//    ComponentToWorld.translation.x = *(float*)(mesh + 0x1c0);
//    ComponentToWorld.translation.y = *(float*)(mesh + 0x1c4);
//    ComponentToWorld.translation.z = *(float*)(mesh + 0x1c8);
//
//    ComponentToWorld.scale.x = *(float*)(mesh + 0x1d0);
//    ComponentToWorld.scale.y = *(float*)(mesh + 0x1d4);
//    ComponentToWorld.scale.z = *(float*)(mesh + 0x1d8);
//
//    LTMatrix Matrix;
//    Matrix = MatrixMultiplication(bone.ToMatrixWithScale(), ComponentToWorld.ToMatrixWithScale());
//
//    result.x = Matrix.d1;
//    result.y = Matrix.d2;
//    result.z = Matrix.d3;
//
//    return result;
//}
//
//
//
////获取点
//long mesh = *(long*)(duixiang + 0x430);
//CVector3 pos = GetBoneWithRotation(mesh, Bones::Head);
//CVector3 head = worldtoscreen(pos, yxjz);
//
//pos = GetBoneWithRotation(mesh, Bones::Spine);
//CVector3 spine = worldtoscreen(pos, yxjz);
//
//pos = GetBoneWithRotation(mesh, Bones::Pelvis);
//CVector3 pelvis = worldtoscreen(pos, yxjz);
//
//
//pos = GetBoneWithRotation(mesh, Bones::Left_Shoulder);
//CVector3 leftShoulder = worldtoscreen(pos, yxjz);
//CVector3 leftElbow = worldtoscreen(GetBoneWithRotation(mesh, Bones::Left_Elbow), yxjz);
//CVector3 leftHand = worldtoscreen(GetBoneWithRotation(mesh, Bones::Left_Hand), yxjz);
//
//pos = GetBoneWithRotation(mesh, Bones::Right_Shoulder);
//CVector3 rightShoulder = worldtoscreen(pos, yxjz);
//CVector3 rightElbow = worldtoscreen(GetBoneWithRotation(mesh, Bones::Right_Elbow), yxjz);
//CVector3 rightHand = worldtoscreen(GetBoneWithRotation(mesh, Bones::Right_Hand), yxjz);
//
//CVector3 leftPelvis = worldtoscreen(GetBoneWithRotation(mesh, Bones::Left_Pelvis), yxjz);
//CVector3 leftKnee = worldtoscreen(GetBoneWithRotation(mesh, Bones::Left_Knee), yxjz);
//CVector3 leftFoot = worldtoscreen(GetBoneWithRotation(mesh, Bones::Left_Foot), yxjz);
//CVector3 rightPelvis = worldtoscreen(GetBoneWithRotation(mesh, Bones::Right_Pelvis), yxjz);
//CVector3 rightKnee = worldtoscreen(GetBoneWithRotation(mesh, Bones::Right_Knee), yxjz);
//CVector3 rightFoot = worldtoscreen(GetBoneWithRotation(mesh, Bones::Right_Foot), yxjz);
//
//
//
////绘制点
//CGContextMoveToPoint(context,head.x, head.y);
//CGContextAddLineToPoint(context,spine.x, spine.y);
//
//CGContextMoveToPoint(context,spine.x, spine.y);
//CGContextAddLineToPoint(context,pelvis.x, pelvis.y);
//
//CGContextMoveToPoint(context,spine.x, spine.y);
//CGContextAddLineToPoint(context,leftShoulder.x, leftShoulder.y);
//CGContextMoveToPoint(context,leftShoulder.x, leftShoulder.y);
//CGContextAddLineToPoint(context,leftElbow.x, leftElbow.y);
//CGContextMoveToPoint(context,leftElbow.x, leftElbow.y);
//CGContextAddLineToPoint(context,leftHand.x, leftHand.y);
//
//CGContextMoveToPoint(context,spine.x, spine.y);
//CGContextAddLineToPoint(context,rightShoulder.x, rightShoulder.y);
//CGContextMoveToPoint(context,rightShoulder.x, rightShoulder.y);
//CGContextAddLineToPoint(context,rightElbow.x, rightElbow.y);
//CGContextMoveToPoint(context,rightElbow.x, rightElbow.y);
//CGContextAddLineToPoint(context,rightHand.x, rightHand.y);
//
//CGContextMoveToPoint(context,pelvis.x, pelvis.y);
//CGContextAddLineToPoint(context,leftPelvis.x, leftPelvis.y);
//CGContextMoveToPoint(context,leftPelvis.x, leftPelvis.y);
//CGContextAddLineToPoint(context,leftKnee.x, leftKnee.y);
//CGContextMoveToPoint(context,leftKnee.x, leftKnee.y);
//CGContextAddLineToPoint(context,leftFoot.x, leftFoot.y);
//
//CGContextMoveToPoint(context,pelvis.x, pelvis.y);
//CGContextAddLineToPoint(context,rightPelvis.x, rightPelvis.y);
//CGContextMoveToPoint(context,rightPelvis.x, rightPelvis.y);
//CGContextAddLineToPoint(context,rightKnee.x, rightKnee.y);
//CGContextMoveToPoint(context,rightKnee.x, rightKnee.y);
//CGContextAddLineToPoint(context,rightFoot.x, rightFoot.y);
