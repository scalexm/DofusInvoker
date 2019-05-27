package com.ankama.codegen.client.api
{
   import com.ankama.codegen.client.model.BakBalance;
   import com.ankama.codegen.client.model.BakBuffer;
   import com.ankama.codegen.client.model.BakError;
   import com.ankama.codegen.client.model.Character;
   import com.ankama.codegen.client.model.CharacterAddScreenshotResponse;
   import com.ankama.codegen.client.model.EntityLook;
   import com.ankama.codegen.client.model.EsportModelLeague;
   import com.ankama.codegen.client.model.EsportModelMap;
   import com.ankama.codegen.client.model.EsportModelMatch;
   import com.ankama.codegen.client.model.EsportModelMatchMatch;
   import com.ankama.codegen.client.model.EsportModelMostPickedBreed;
   import com.ankama.codegen.client.model.EsportModelPlayer;
   import com.ankama.codegen.client.model.EsportModelRanking;
   import com.ankama.codegen.client.model.EsportModelRound;
   import com.ankama.codegen.client.model.EsportModelRoundPickAndBan;
   import com.ankama.codegen.client.model.EsportModelRoundSeasonTeamPlayer;
   import com.ankama.codegen.client.model.EsportModelRoundsKillAndDead;
   import com.ankama.codegen.client.model.EsportModelSeason;
   import com.ankama.codegen.client.model.EsportModelSeasonTeamPlayer;
   import com.ankama.codegen.client.model.EsportModelStatus;
   import com.ankama.codegen.client.model.EsportModelTeam;
   import com.ankama.codegen.client.model.Guild;
   import com.ankama.codegen.client.model.HaapiException;
   import com.ankama.codegen.client.model.LadderModelAchievement;
   import com.ankama.codegen.client.model.LadderModelExperience;
   import com.ankama.codegen.client.model.LadderModelFAchievement;
   import com.ankama.codegen.client.model.LadderModelFExperience;
   import com.ankama.codegen.client.model.LadderModelFJob;
   import com.ankama.codegen.client.model.LadderModelFMonsterKill;
   import com.ankama.codegen.client.model.LadderModelFPioneerAchievement;
   import com.ankama.codegen.client.model.LadderModelFPioneerJob;
   import com.ankama.codegen.client.model.LadderModelFPioneerLevelBreed;
   import com.ankama.codegen.client.model.LadderModelFPioneerMonster;
   import com.ankama.codegen.client.model.LadderModelFRanking;
   import com.ankama.codegen.client.model.LadderModelHumanCharacter;
   import com.ankama.codegen.client.model.LadderModelJob;
   import com.ankama.codegen.client.model.LadderModelMonsterHunt;
   import com.ankama.codegen.client.model.LadderModelMonsterHunter;
   import com.ankama.codegen.client.model.LadderModelMonsterKill;
   import com.ankama.codegen.client.model.LadderModelPioneerAchievement;
   import com.ankama.codegen.client.model.LadderModelPioneerJob;
   import com.ankama.codegen.client.model.LadderModelPioneerLevelBreed;
   import com.ankama.codegen.client.model.LadderModelPioneerMonster;
   import com.ankama.codegen.client.model.LadderModelPioneers;
   import com.ankama.codegen.client.model.LadderModelRanking;
   
   public class ModelList
   {
       
      
      private var forceImportBakBuffer:BakBuffer = null;
      
      private var forceImportBakBalance:BakBalance = null;
      
      private var forceImportBakError:BakError = null;
      
      private var forceImportCharacterAddScreenshotResponse:CharacterAddScreenshotResponse = null;
      
      private var forceImportCharacter:Character = null;
      
      private var forceImportGuild:Guild = null;
      
      private var forceImportEntityLook:EntityLook = null;
      
      private var forceImportEsportModelLeague:EsportModelLeague = null;
      
      private var forceImportEsportModelSeason:EsportModelSeason = null;
      
      private var forceImportEsportModelTeam:EsportModelTeam = null;
      
      private var forceImportEsportModelPlayer:EsportModelPlayer = null;
      
      private var forceImportEsportModelSeasonTeamPlayer:EsportModelSeasonTeamPlayer = null;
      
      private var forceImportEsportModelRoundSeasonTeamPlayer:EsportModelRoundSeasonTeamPlayer = null;
      
      private var forceImportEsportModelRound:EsportModelRound = null;
      
      private var forceImportEsportModelMatch:EsportModelMatch = null;
      
      private var forceImportEsportModelMatchMatch:EsportModelMatchMatch = null;
      
      private var forceImportEsportModelMap:EsportModelMap = null;
      
      private var forceImportEsportModelRoundPickAndBan:EsportModelRoundPickAndBan = null;
      
      private var forceImportEsportModelRanking:EsportModelRanking = null;
      
      private var forceImportEsportModelMostPickedBreed:EsportModelMostPickedBreed = null;
      
      private var forceImportEsportModelRoundsKillAndDead:EsportModelRoundsKillAndDead = null;
      
      private var forceImportEsportModelStatus:EsportModelStatus = null;
      
      private var forceImportLadderModelFPioneerAchievement:LadderModelFPioneerAchievement = null;
      
      private var forceImportLadderModelFAchievement:LadderModelFAchievement = null;
      
      private var forceImportLadderModelPioneerAchievement:LadderModelPioneerAchievement = null;
      
      private var forceImportLadderModelPioneers:LadderModelPioneers = null;
      
      private var forceImportLadderModelHumanCharacter:LadderModelHumanCharacter = null;
      
      private var forceImportLadderModelAchievement:LadderModelAchievement = null;
      
      private var forceImportLadderModelFExperience:LadderModelFExperience = null;
      
      private var forceImportLadderModelFPioneerLevelBreed:LadderModelFPioneerLevelBreed = null;
      
      private var forceImportLadderModelExperience:LadderModelExperience = null;
      
      private var forceImportLadderModelPioneerLevelBreed:LadderModelPioneerLevelBreed = null;
      
      private var forceImportLadderModelFJob:LadderModelFJob = null;
      
      private var forceImportLadderModelFPioneerJob:LadderModelFPioneerJob = null;
      
      private var forceImportLadderModelJob:LadderModelJob = null;
      
      private var forceImportLadderModelPioneerJob:LadderModelPioneerJob = null;
      
      private var forceImportLadderModelMonsterHunt:LadderModelMonsterHunt = null;
      
      private var forceImportLadderModelMonsterHunter:LadderModelMonsterHunter = null;
      
      private var forceImportLadderModelFMonsterKill:LadderModelFMonsterKill = null;
      
      private var forceImportLadderModelFPioneerMonster:LadderModelFPioneerMonster = null;
      
      private var forceImportLadderModelPioneerMonster:LadderModelPioneerMonster = null;
      
      private var forceImportLadderModelMonsterKill:LadderModelMonsterKill = null;
      
      private var forceImportLadderModelFRanking:LadderModelFRanking = null;
      
      private var forceImportLadderModelRanking:LadderModelRanking = null;
      
      private var forceImportHaapiException:HaapiException = null;
      
      public function ModelList()
      {
         super();
      }
   }
}
