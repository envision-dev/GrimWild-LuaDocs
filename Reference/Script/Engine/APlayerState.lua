---@meta
---A PlayerState is created for every player on a server (or in a standalone game).
---PlayerStates are replicated to all clients, and contain network game relevant information about the player, such as playername, score, etc.
---@class APlayerState : AInfo
---@field public Score number
---@field public PlayerId integer
---@field private CompressedPing integer @Replicated compressed ping for this player (holds ping in msec divided by 4)
---@field private bShouldUpdateReplicatedPing boolean @Whether or not this player's replicated CompressedPing value is updated automatically. Since player states are always relevant by default, in cases where there are many players replicating, replicating the ping value can cause additional unnecessary overhead on servers if the value isn't needed on clients.
---@field public bIsSpectator boolean
---@field public bOnlySpectator boolean
---@field public bIsABot boolean
---@field public bIsInactive boolean
---@field public bFromPreviousLevel boolean
---@field public StartTime integer
---@field public EngineMessageClass TSubclassOf<ULocalMessage> @This is used for sending game agnostic messages that can be localized
---@field public SavedNetworkAddress string @Used to match up InactivePlayerState with rejoining playercontroller.
---@field public UniqueId FUniqueNetIdRepl
---@field public OnPawnSet MulticastDelegate|fun(Player: APlayerState, NewPawn: APawn, OldPawn: APawn) @Broadcast whenever this player's possessed pawn is set
---@field private PawnPrivate APawn @The pawn that is controlled by by this player state.
---@field private PlayerNamePrivate string @Player name, or blank if none.
APlayerState = {}

---Gets the online unique id for a player. If a player is logged in this will be consistent across all clients and servers.
---@return FUniqueNetIdRepl
function APlayerState:BP_GetUniqueId() end

---Gets the literal value of the compressed Ping value (Ping = PingInMS / 4).
---@return integer
function APlayerState:GetCompressedPing() end

---Return the pawn controlled by this Player State.
---@return APawn
function APlayerState:GetPawn() end

---Returns the ping (in milliseconds)
---Returns ExactPing if available (local players or when running on the server), and
---the replicated CompressedPing (converted back to milliseconds) otherwise.
---Note that replication of CompressedPing is controlled by bShouldUpdateReplicatedPing,
---and if disabled then this will return 0 or a stale value on clients for player states
---that aren't related to local players
---@return number
function APlayerState:GetPingInMilliseconds() end

---Return the player controller that created this player state, or null for remote clients
---@return APlayerController
function APlayerState:GetPlayerController() end

---Gets the literal value of PlayerId.
---@return integer
function APlayerState:GetPlayerId() end

---returns current player name
---@return string
function APlayerState:GetPlayerName() end

---Gets the literal value of Score.
---@return number
function APlayerState:GetScore() end

---Gets the literal value of bIsABot.
---@return boolean
function APlayerState:IsABot() end

---Gets the literal value of bOnlySpectator.
---@return boolean
function APlayerState:IsOnlyASpectator() end

---Gets the literal value of bIsSpectator.
---@return boolean
function APlayerState:IsSpectator() end

---@param InActor AActor
function APlayerState:OnPawnPrivateDestroyed(InActor) end

function APlayerState:OnRep_bIsInactive() end

function APlayerState:OnRep_PlayerId() end

function APlayerState:OnRep_PlayerName() end

---Replication Notification Callbacks
function APlayerState:OnRep_Score() end

function APlayerState:OnRep_UniqueId() end

---Can be implemented in Blueprint Child to move more properties from old to new PlayerState when traveling to a new level
---@param NewPlayerState APlayerState @New PlayerState, which we fill with the current properties
function APlayerState:ReceiveCopyProperties(NewPlayerState) end

---Can be implemented in Blueprint Child to move more properties from old to new PlayerState when reconnecting
---@param OldPlayerState APlayerState @Old PlayerState, which we use to fill the new one with
function APlayerState:ReceiveOverrideWith(OldPlayerState) end

