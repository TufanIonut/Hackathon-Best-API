﻿using Hackathon_Best_API.DTOs;
using Hackathon_Best_API.Interfaces;
using Hackathon_Best_API.Models;
using Hackathon_Best_API.Requests;
using Microsoft.AspNetCore.Mvc;
using Serilog;

namespace Hackathon_Best_API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class NotesController : ControllerBase
    {
    private readonly INotesRepository _notesRepository;
        public NotesController(INotesRepository notesRepository)
        {
        _notesRepository = notesRepository;

        }

        [HttpGet]
        [Route("GetNotes")]
        public async Task<IEnumerable<Notes>> GetNotes(int IdUser)
        {
            var result = await _notesRepository.GetNotesAsync(IdUser);
            Log.Information("Notes :" + result);
            return result;

        }
        [HttpPost]
        [Route("InsertNote")]
        
        public async Task<IActionResult> InsertNotes([FromBody] NoteDTO noteDTO)
        {
            var result = await _notesRepository.InsertNoteAsync(noteDTO);
            Log.Information("Note Inserted" + result);
            if (result == 1)
            {
                return Ok("Isert Successful");
            }
            else
            {
                return BadRequest();
            }
        }
        [HttpPut]
        [Route("UpdateNote")]
        public async Task<IActionResult> UpdateNotes([FromBody] NotesRequest notesRequest)
        {
            var result = await _notesRepository.UpdateNoteAsync(notesRequest);
            Log.Information("Note Updated" + result);
            if (result == 1)
            {
                return Ok("Update Successful");
            }
            else
            {
                return BadRequest();
            }
        }
        [HttpDelete]
        [Route("DeleteNote")]
        public async Task<IActionResult> DeleteNotes(int IdNote)
        {
            var result = await _notesRepository.DeleteNoteAsync(IdNote);
            Log.Information("Note Deleted" + result);
            if (result == 1)
            {
                return Ok("Delete Successful");
            }
            else
            {
                return BadRequest();
            }
        }
    }
}
