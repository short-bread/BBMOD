/// @func bbmod_animation_bone()
/// @desc Contains definition of the AnimationBone structure.
/// @see BBMOD_EAnimationBone

/// @enum An enumeration of members of an AnimationBone structure.
enum BBMOD_EAnimationBone
{
	/// @member The bone index.
	BoneIndex,
	/// @member An array of PositionKey structures.
	PositionKeys,
	/// @member An array of RotationKey structures.
	RotationKeys,
	/// @member The size of the AnimationBone structure.
	SIZE
};